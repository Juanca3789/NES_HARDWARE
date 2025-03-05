#include "CPU.h"

CPU::CPU(Bus* bus) : bus(bus), A(0x00), X(0x00), Y(0x00), SP(0xFF), P(0x34){
	this->PC = this->bus->cpuRead(0xFFFC) | (this->bus->cpuRead(0xFFFD) << 8);
}

//Obtención de datos
uint8_t CPU::fetchByte(){return this->bus->cpuRead(this->PC++);}

uint16_t CPU::fetchAddress(){
	uint16_t low_byte = this->fetchByte();
	return (this->fetchByte() << 8) | low_byte;
}

uint16_t CPU::readAddress(const uint16_t& lowByte){return this->bus->cpuRead(lowByte) | (this->bus->cpuRead((lowByte + 1) & 0xFF) << 8);}

void CPU::pushToStack(uint8_t value){
	this->bus->cpuWrite((0x0100 | this->SP--), value);
}

uint8_t CPU::pullFromStack(){
	return this->bus->cpuRead((0x0100 | ++this->SP));
}

//Modos de direccionamiento direccion
uint16_t CPU::zeropageAddress(){return this->fetchByte();}
uint16_t CPU::zeropageXAddress(){return (this->fetchByte() + this->X) & 0xFF;}
uint16_t CPU::zeropageYAddress(){return (this->fetchByte() + this->Y) & 0xFF;}
uint16_t CPU::absoluteAddress(){return this->fetchAddress();}
uint16_t CPU::absoluteXAddress(bool& pageCrossed){
	uint16_t address = this->fetchAddress();
	uint16_t sum =  address + this->X;
	pageCrossed = (address & 0xFF00) != (sum & 0xFF00);
	return sum;
}
uint16_t CPU::absoluteYAddress(bool& pageCrossed){
	uint16_t address = this->fetchAddress();
	uint16_t sum =  address + this->Y;
	pageCrossed = (address & 0xFF00) != (sum & 0xFF00);
	return sum;
}
uint16_t CPU::indirectXAddress(){
	uint8_t zp = (this->fetchByte() + this->X);
	return this->readAddress(zp);
}
uint16_t CPU::indirectYAddress(bool& pageCrossed){
	uint8_t zp = this->fetchByte();
	uint16_t readed_address = this->readAddress(zp);
	uint16_t sum = readed_address + this->Y;
	pageCrossed = (readed_address & 0xFF00) != (sum & 0xFF00);
	return sum;
}

//Modos de direccionamiento valor
uint8_t CPU::immediate(){return this->fetchByte();}
uint8_t CPU::zeropage(){return this->bus->cpuRead(this->zeropageAddress());}
uint8_t CPU::zeropageX(){return this->bus->cpuRead(this->zeropageXAddress());}
uint8_t CPU::zeropageY(){return this->bus->cpuRead(this->zeropageYAddress());}
uint8_t CPU::absolute(){return this->bus->cpuRead(this->absoluteAddress());}
uint8_t CPU::absoluteX(bool& pageCrossed){return this->bus->cpuRead(this->absoluteXAddress(pageCrossed));}
uint8_t CPU::absoluteY(bool& pageCrossed){return this->bus->cpuRead(this->absoluteYAddress(pageCrossed));}
uint8_t CPU::indirectX(){return this->bus->cpuRead(this->indirectXAddress());}
uint8_t CPU::indirectY(bool& pageCrossed){return this->bus->cpuRead(this->indirectYAddress(pageCrossed));}

//Actualizadores de los flags
void CPU::updateZeroFlag(const uint8_t& result){
	if(result == 0){
		this->P |= 0b00000010;		
	}
	else{
		this->P &= 0b11111101;
	}
}

void CPU::updateNegativeFlag(const uint8_t& result){
	if(result & 0b10000000){
		this->P |= 0b10000000;
	}
	else{
		this->P &= 0b01111111;
	}
}

void CPU::updateCarryFlag(const bool& carry){
	if(carry){
		this->P |= 0b00000001;
	}
	else{
		this->P &= 0b11111110;
	}
}

void CPU::updateOverflowFlag(const uint8_t& value_1, const uint8_t& value_2, const uint8_t& result){
	if((value_1 & 0b10000000) == (value_2 & 0b10000000)){
		if((value_1 & 0b10000000) != (result & 0b10000000)){
			this->P |= 0b01000000;
			return;
		}
	}	
	this->P &= 0b10111111;
}

void CPU::updateBFlag(const bool& value){
	if(value){
		this->P |= 0b00010000;
	}
	else{
		this->P &= 0b11101111;
	}
}

void CPU::updateInterruptFlag(const bool& value){
	if(value){
		this->P |= 0b00000100;
	}
	else{
		this->P &= 0b11111011;
	}
}

//Instrucciones genericas
uint8_t CPU::branchIf(const bool& condition){
	int8_t signed_jump = static_cast<int8_t>(this->fetchByte());
	if(condition){
		uint16_t oldPC = this->PC;
		this->PC += signed_jump;
		return ((this->PC & 0xFF00) != (oldPC & 0xFF00)) ? 2 : 1;
	}
	return 0;
}

//Instrucciones de la CPU
void CPU::ADC(const uint8_t& mode){
	uint8_t old_A = this->A;
	uint16_t result = (uint16_t)this->A + (uint16_t)mode + (this->P & 0b00000001);
	this->updateCarryFlag(result > 0xFF);
	this->A = (uint8_t)result;
	this->updateNegativeFlag(this->A);
	this->updateZeroFlag(this->A);
	this->updateOverflowFlag(old_A, mode, this->A);
}

void CPU::AND(const uint8_t& mode){
	this->A &= mode;
	this->updateZeroFlag(this->A);
	this->updateNegativeFlag(this->A);
}

void CPU::ASL(){
	this->updateCarryFlag(this->A & 0b10000000);
	this->A <<= 1;
	this->updateZeroFlag(this->A);
	this->updateNegativeFlag(this->A);
}

void CPU::ASL(const uint16_t& addressMode){
	uint8_t value = this->bus->cpuRead(addressMode);
	this->updateCarryFlag(value & 0b10000000);
	value <<= 1;
	this->bus->cpuWrite(addressMode, value);
	this->updateZeroFlag(value);
	this->updateNegativeFlag(value);
}

uint8_t CPU::BCC(){return this->branchIf(!(this->P & 0b00000001));}
uint8_t CPU::BCS(){return this->branchIf(this->P & 0b00000001);}
uint8_t CPU::BEQ(){return this->branchIf(this->P & 0b00000010);}

void CPU::BIT(const uint16_t& addressMode){
	uint8_t value = this->bus->cpuRead(addressMode);
	this->updateZeroFlag(this->A & value);
	this->updateNegativeFlag(value);
	this->P = (this->P & 0b10111111) | (value & 0b01000000);
}

uint8_t CPU::BMI(){return this->branchIf(this->P & 0b10000000);}
uint8_t CPU::BNE(){return this->branchIf(!(this->P & 0b00000010));}
uint8_t CPU::BPL(){return this->branchIf(!(this->P & 0b10000000));}
uint8_t CPU::BVC(){return this->branchIf(!(this->P & 0b01000000));}
uint8_t CPU::BVS(){return this->branchIf(this->P & 0b01000000);}

void CPU::BRK(){
	this->PC++;
	this->pushToStack(static_cast<uint8_t>(this->PC >> 8));
	this->pushToStack(static_cast<uint8_t>(this->PC));
	this->updateBFlag(1);
	this->pushToStack(this->P);
	this->updateInterruptFlag(1);
	this->PC = this->bus->cpuRead(0xFFFE) | (this->bus->cpuRead(0xFFFF) << 8);
}

void CPU::CLC(){this->P &= 0b11111110;}
void CPU::CLD(){this->P &= 0b11110111;}
void CPU::CLI(){this->P &= 0b11111011;}
void CPU::CLV(){this->P &= 0b10111111;}

void CPU::CMP(const uint8_t& mode){
	uint8_t result = this->A - mode;
	this->updateCarryFlag(this->A >= mode);
	this->updateZeroFlag(result);
	this->updateNegativeFlag(result);
}

void CPU::CPX(const uint8_t& mode){
	uint8_t result = this->X - mode;
	this->updateCarryFlag(this->X >= mode);
	this->updateZeroFlag(result);
	this->updateNegativeFlag(result);
}

void CPU::CPY(const uint8_t& mode){
	uint8_t result = this->Y - mode;
	this->updateCarryFlag(this->Y >= mode);
	this->updateZeroFlag(result);
	this->updateNegativeFlag(result);
}

void CPU::DEC(const uint16_t& addressMode){
	uint8_t value = this->bus->cpuRead(addressMode) - 1;
	this->bus->cpuWrite(addressMode, value);
	this->updateZeroFlag(value);
	this->updateNegativeFlag(value);
}

void CPU::DEX(){
	this->X -= 1;
	this->updateZeroFlag(this->X);
	this->updateNegativeFlag(this->X);
}

void CPU::DEY(){
	this->Y -= 1;
	this->updateZeroFlag(this->Y);
	this->updateNegativeFlag(this->Y);
}

void CPU::EOR(const uint8_t& mode){
	this->A ^= mode;
	this->updateZeroFlag(this->A);
	this->updateNegativeFlag(this->A);
}

void CPU::INC(const uint16_t& addressMode){
	uint8_t value = this->bus->cpuRead(addressMode) + 1;
	this->bus->cpuWrite(addressMode, value);
	this->updateZeroFlag(value);
	this->updateNegativeFlag(value);
}

void CPU::INX(){
	this->X += 1;
	this->updateZeroFlag(this->X);
	this->updateNegativeFlag(this->X);
}

void CPU::INY(){
	this->Y += 1;
	this->updateZeroFlag(this->Y);
	this->updateNegativeFlag(this->Y);
}

void CPU::JMP(){
	this->PC = this->absoluteAddress();
}

void CPU::JMP(const uint16_t& addressMode){
	this->PC = static_cast<uint16_t>(this->bus->cpuRead(addressMode)) << 8 | static_cast<uint16_t>(this->bus->cpuRead((addressMode & 0x00FF) == 0x00FF ? (addressMode & 0xFF00) : (addressMode + 1)));
}

void CPU::JSR(){
	uint16_t oldPc = this->PC + 2;
	this->PC = this->absoluteAddress();
	this->pushToStack(static_cast<uint8_t>(oldPc >> 8));
	this->pushToStack(static_cast<uint8_t>(oldPc));
}

void CPU::LDA(const uint8_t& mode){
	this->A = mode;
	this->updateZeroFlag(this->A);
	this->updateNegativeFlag(this->A);
}

void CPU::LDX(const uint8_t& mode){
	this->X = mode;
	this->updateZeroFlag(this->X);
	this->updateNegativeFlag(this->X);
}

void CPU::LDY(const uint8_t& mode){
	this->Y = mode;
	this->updateZeroFlag(this->Y);
	this->updateNegativeFlag(this->Y);
}

void CPU::LSR(){
	this->updateCarryFlag(this->A & 0b00000001);
	this->A >>= 1;
	this->updateZeroFlag(this->A);
	this->updateNegativeFlag(this->A);
}

void CPU::LSR(const uint16_t& addressMode){
	uint8_t value = this->bus->cpuRead(addressMode);
	this->updateCarryFlag(value & 0b00000001);
	value >>= 1;
	this->bus->cpuWrite(addressMode, value);
	this->updateZeroFlag(value);
	this->updateNegativeFlag(value);
}

void CPU::NOP(){}

void CPU::ORA(const uint8_t& mode){
	this->A |= mode;
	this->updateZeroFlag(this->A);
	this->updateNegativeFlag(this->A);
}

void CPU::PHA(){
	this->pushToStack(this->A);
}

void CPU::PHP(){
	this->updateBFlag(1);
	this->pushToStack(this->P);
}

void CPU::PLA(){
	this->A = this->pullFromStack();
	this->updateZeroFlag(this->A);
	this->updateNegativeFlag(this->A);
}

void CPU::PLP(){
	this->P = this->pullFromStack();
}

void CPU::ROL(){
	uint8_t oldCarry = this->P & 0b00000001;
	this->updateCarryFlag(this->A & 0b10000000);
	this->A <<= 1;
	this->A |= oldCarry;
	this->updateZeroFlag(this->A);
	this->updateNegativeFlag(this->A);
}

void CPU::ROL(const uint16_t& addressMode){
	uint8_t value = this->bus->cpuRead(addressMode);
	uint8_t oldCarry = this->P & 0b00000001;
	this->updateCarryFlag(value & 0b10000000);
	value <<= 1;
	value |= oldCarry;
	this->bus->cpuWrite(addressMode, value);
	this->updateZeroFlag(value);
	this->updateNegativeFlag(value);
}

void CPU::ROR(){
	uint8_t oldCarry = this->P & 0b00000001;
	this->updateCarryFlag(this->A & 0b00000001);
	this->A >>= 1;
	this->A |= oldCarry << 7;
	this->updateZeroFlag(this->A);
	this->updateNegativeFlag(this->A);
}

void CPU::ROR(const uint16_t& addressMode){
	uint8_t value = this->bus->cpuRead(addressMode);
	uint8_t oldCarry = this->P & 0b00000001;
	this->updateCarryFlag(value & 0b00000001);
	value >>= 1;
	value |= oldCarry;
	this->bus->cpuWrite(addressMode, value);
	this->updateZeroFlag(value);
	this->updateNegativeFlag(value);
}

void CPU::RTI(){
	this->P = this->pullFromStack();
	uint16_t low_byte = this->pullFromStack();
	uint16_t high_byte = this->pullFromStack() << 8;
	this->PC = (high_byte | low_byte);
}

void CPU::RTS(){
	uint16_t low_byte = this->pullFromStack();
	uint16_t high_byte = this->pullFromStack() << 8;
	this->PC = (high_byte | low_byte) + 1;
}

void CPU::SBC(const uint8_t& mode){
	uint8_t old_A = this->A;
	uint16_t result = (uint16_t)this->A - (uint16_t)mode - (1 - (this->P & 0b00000001));
    this->updateCarryFlag(result < 0x100);
	this->A = (uint8_t)result;
    this->updateZeroFlag(this->A);
    this->updateNegativeFlag(this->A);
    this->updateOverflowFlag(old_A, mode, this->A);
}

void CPU::SED(){this->P |= 0b00001000;}
void CPU::SEC(){this->P |= 0b00000001;}
void CPU::SEI(){this->P |= 0b00000100;}

void CPU::STA(const uint16_t& addressMode){
	this->bus->cpuWrite(addressMode, this->A);
}

void CPU::STX(const uint16_t& addressMode){
	this->bus->cpuWrite(addressMode, this->X);
}

void CPU::STY(const uint16_t& addressMode){
	this->bus->cpuWrite(addressMode, this->Y);
}

void CPU::TAX(){
	this->X = this->A;
	this->updateZeroFlag(this->X);
	this->updateNegativeFlag(this->X);
}

void CPU::TAY(){
	this->Y = this->A;
	this->updateZeroFlag(this->Y);
	this->updateNegativeFlag(this->Y);
}

void CPU::TSX(){
	this->X = this->SP;
	this->updateZeroFlag(this->X);
	this->updateNegativeFlag(this->X);
}

void CPU::TXA(){
	this->A = this->X;
	this->updateZeroFlag(this->A);
	this->updateNegativeFlag(this->A);
}

void CPU::TXS(){
	this->SP = this->X;
}

void CPU::TYA(){
	this->A = this->Y;
	this->updateZeroFlag(this->A);
	this->updateNegativeFlag(this->A);
}

uint8_t CPU::execute_instruction(const uint8_t& opcode){
	bool pageCrossed = false;
	switch(opcode){
		case 0x00:
			this->BRK();
			return 7;
		case 0x01:
			this->ORA(this->indirectX());
			return 6;
		case 0x05:
			this->ORA(this->zeropage());
			return 3;
		case 0x06:
			this->ASL(this->zeropageAddress());
			return 5;
		case 0x08:
			this->PHP();
			return 3;
		case 0x09:
			this->ORA(this->immediate());
			return 2;
		case 0x0A:
			this->ASL();
			return 2;
		case 0x0D:
			this->ORA(this->absolute());
			return 4;
		case 0x0E:
			this->ASL(this->absoluteAddress());
			return 6;
		case 0x10:
			return 2 + this->BPL();
		case 0x11:
			this->ORA(this->indirectY(pageCrossed));
			return 5 + (pageCrossed ? 1 : 0);
		case 0x15:
			this->ORA(this->zeropageX());
			return 4;
		case 0x16:
			this->ASL(this->zeropageXAddress());
			return 6;
		case 0x18:
			this->CLC();
			return 2;
		case 0x19:
			this->ORA(this->absoluteY(pageCrossed));
			return 4 + (pageCrossed ? 1 : 0);
		case 0x1D:
			this->ORA(this->absoluteX(pageCrossed));
			return 4 + (pageCrossed ? 1 : 0);
		case 0x1E:
			this->ASL(this->absoluteXAddress(pageCrossed));
			return 7;
		case 0x20:
			this->JSR();
			return 6;
		case 0x21:
			this->AND(this->indirectX());
			return 6;
		case 0x24:
			this->BIT(this->zeropageAddress());
			return 3;
		case 0x25:
			this->AND(this->zeropage());
			return 3;
		case 0x26:
			this->ROL(this->zeropageAddress());
			return 5;
		case 0x28:
			this->PLP();
			return 4;
		case 0x29:
			this->AND(this->immediate());
			return 2;
		case 0x2A:
			this->ROL();
			return 2;
		case 0x2C:
			this->BIT(this->absoluteAddress());
			return 4;
		case 0x2D:
			this->AND(this->absolute());
			return 4;
		case 0x2E:
			this->ROL(this->absoluteAddress());
			return 6;
		case 0x30:
			return 2 + this->BMI();
		case 0x31:
			this->AND(this->indirectY(pageCrossed));
			return 5 + (pageCrossed ? 1 : 0);
		case 0x35:
			this->AND(this->zeropageX());
			return 4;
		case 0x36:
			this->ROL(this->zeropageXAddress());
			return 6;
		case 0x38:
			this->SEC();
			return 2;
		case 0x39:
			this->AND(this->absoluteY(pageCrossed));
			return 	4 + (pageCrossed ? 1 : 0);
		case 0x3D:
			this->AND(this->absoluteY(pageCrossed));
			return 4 + (pageCrossed ? 1 : 0);
		case 0x3E:
			this->ROL(this->absoluteXAddress(pageCrossed));
			return 7;
		case 0x40:
			this->RTI();
			return 6;
		case 0x41:
			this->EOR(this->indirectX());
			return 6;
		case 0x45:
			this->EOR(this->zeropage());
			return 3;
		case 0x46:
			this->LSR(this->zeropageAddress());
			return 5;
		case 0x48:
			this->PHA();
			return 3;
		case 0x49:
			this->EOR(this->immediate());
			return 2;
		case 0x4A:
			this->LSR();
			return 2;
		case 0x4C:
			this->JMP();
			return 3;
		case 0x4D:
			this->EOR(this->absolute());
			return 4;
		case 0x4E:
			this->LSR(this->absoluteAddress());
			return 6;
		case 0x50:
			return 2 + this->BVC();
		case 0x51:
			this->EOR(this->indirectY(pageCrossed));
			return 5 + (pageCrossed ? 1 : 0);
		case 0x55:
			this->EOR(this->zeropageX());
			return 4;
		case 0x56:
			this->LSR(this->zeropageXAddress());
			return 6;
		case 0x58:
			this->CLI();
			return 2;
		case 0x59:
			this->EOR(this->absoluteY(pageCrossed));
			return 4 + (pageCrossed ? 1 : 0);
		case 0x5D:
			this->EOR(this->absoluteX(pageCrossed));
			return 4 + (pageCrossed ? 1 : 0);
		case 0x5E:
			this->LSR(this->absoluteXAddress(pageCrossed));
			return 7;
		case 0x60:
			this->RTS();
			return 6;
		case 0x61:
			this->ADC(this->indirectX());
			return 6;
		case 0x65:
			this->ADC(this->zeropage());
			return 3;
		case 0x66:
			this->ROR(this->zeropageAddress());
			return 5;
		case 0x68:
			this->PLA();
			return 4;
		case 0x69:
			this->ADC(this->immediate());
			return 2;
		case 0x6A:
			this->ROR();
			return 2;
		case 0x6C:
			this->JMP(this->absoluteAddress());
			return 5;
		case 0x6D:
			this->ADC(this->absolute());
			return 4;
		case 0x6E:
			this->ROR(this->absoluteAddress());
			return 6;
		case 0x70:
			return 2 + this->BVS();
		case 0x71:
			this->ADC(this->indirectY(pageCrossed));
			return 5 + (pageCrossed ? 1 : 0);
		case 0x75:
			this->ADC(this->zeropageX());
			return 4;
		case 0x76:
			this->ROR(this->zeropageXAddress());
			return 6;
		case 0x78:
			this->SEI();
			return 2;
		case 0x79:
			this->ADC(this->absoluteY(pageCrossed));
			return 4 + (pageCrossed ? 1 : 0);
		case 0x7D:
			this->ADC(this->absoluteX(pageCrossed));
			return 4 + (pageCrossed ? 1 : 0);
		case 0x7E:
			this->ROR(this->absoluteXAddress(pageCrossed));
			return 7;
		case 0x81:
			this->STA(this->indirectXAddress());
			return 6;
		case 0x84:
			this->STY(this->zeropageAddress());
			return 3;
		case 0x85:
			this->STA(this->zeropageAddress());
			return 3;
		case 0x86:
			this->STX(this->zeropageAddress());
			return 3;
		case 0x88:
			this->DEY();
			return 2;
		case 0x8A:
			this->TXA();
			return 2;
		case 0x8C:
			this->STY(this->absoluteAddress());
			return 4;
		case 0x8D:
			this->STA(this->absoluteAddress());
			return 4;
		case 0x8E:
			this->STX(this->absoluteAddress());
			return 4;
		case 0x90:
			return 2 + this->BCC();
		case 0x91:
			this->STA(this->indirectYAddress(pageCrossed));
			return 6;
		case 0x94:
			this->STY(this->zeropageXAddress());
			return 4;
		case 0x95:
			this->STA(this->zeropageXAddress());
			return 4;
		case 0x96:
			this->STX(this->zeropageYAddress());
			return 4;
		case 0x98:
			this->TYA();
			return 2;
		case 0x99:
			this->STA(this->absoluteYAddress(pageCrossed));
			return 5;
		case 0x9A:
			this->TXS();
			return 2;
		case 0x9D:
			this->STA(this->absoluteXAddress(pageCrossed));
			return 5;
		case 0xA0:
			this->LDY(this->immediate());
			return 2;
		case 0xA1:
			this->LDA(this->indirectX());
			return 6;
		case 0xA2:
			this->LDX(this->immediate());
			return 2;
		case 0xA5:
			this->LDA(this->zeropage());
			return 3;
		case 0xA6:
			this->LDX(this->zeropage());
			return 3;
		case 0xA8:
			this->TAY();
			return 2;
		case 0xA9:
			this->LDA(this->immediate());
			return 2;
		case 0xAA:
			this->TAX();
			return 2;
		case 0xAC:
			this->LDY(this->absolute());
			return 4;
		case 0xAD:
			this->LDA(this->absolute());
			return 4;
		case 0xAE:
			this->LDX(this->absolute());
			return 4;
		case 0xB0:
			return 2 + this->BCS();
		case 0xB1:
			this->LDA(this->indirectY(pageCrossed));
			return 5 + (pageCrossed ? 1 : 0);
		case 0xB4:
			this->LDY(this->zeropageX());
			return 4;
		case 0xB5:
			this->LDA(this->zeropageX());
			return 4;
		case 0xB6:
			this->LDX(this->zeropageY());
			return 4;
		case 0xB8:
			this->CLV();
			return 2;
		case 0xB9:
			this->LDA(this->absoluteY(pageCrossed));
			return 4 + (pageCrossed ? 1 : 0);
		case 0xBA:
			this->TSX();
			return 2;
		case 0xBC:
			this->LDY(this->absoluteX(pageCrossed));
			return 4 + (pageCrossed ? 1 : 0);
		case 0xBD:
			this->LDA(this->absoluteX(pageCrossed));
			return 4 + (pageCrossed ? 1 : 0);
		case 0xBE:
			this->LDX(this->absoluteX(pageCrossed));
			return 4 + (pageCrossed ? 1 : 0);
		case 0xC0:
			this->CPY(this->immediate());
			return 2;
		case 0xC1:
			this->CMP(this->indirectX());
			return 6;
		case 0xC4:
			this->CPY(this->zeropage());
			return 3;
		case 0xC5:
			this->CMP(this->zeropage());
			return 3;
		case 0xC6:
			this->DEC(this->zeropageAddress());
			return 5;
		case 0xC8:
			this->INY();
			return 2;
		case 0xC9:
			this->CMP(this->immediate());
			return 2;
		case 0xCA:
			this->DEX();
			return 2;
		case 0xCC:
			this->CPY(this->absolute());
			return 4;
		case 0xCD:
			this->CMP(this->absolute());
			return 4;
		case 0xCE:
			this->DEC(this->absoluteAddress());
			return 6;
		case 0xD0:
			return 2 + this->BNE();
		case 0xD1:
			this->CMP(this->indirectY(pageCrossed));
			return 5 + (pageCrossed ? 1 : 0);
		case 0xD5:
			this->CMP(this->zeropageX());
			return 4;
		case 0xD6:
			this->DEC(this->zeropageXAddress());
			return 6;
		case 0xD8:
			this->CLD();
			return 2;
		case 0xD9:
			this->CMP(this->absoluteY(pageCrossed));
			return 4 + (pageCrossed ? 1 : 0);
		case 0xDD:
			this->CMP(this->absoluteX(pageCrossed));
			return 4 + (pageCrossed ? 1 : 0);
		case 0xDE:
			this->DEC(this->absoluteXAddress(pageCrossed));
			return 7;
		case 0xE0:
			this->CPX(this->immediate());
			return 2;
		case 0xE1:
			this->SBC(this->indirectX());
			return 6;
		case 0xE4:
			this->CPX(this->zeropage());
			return 3;
		case 0xE5:
			this->SBC(this->zeropage());
			return 3;
		case 0xE6:
			this->INC(this->zeropageAddress());
			return 5;
		case 0xE8:
			this->INX();
			return 2;
		case 0xE9:
			this->SBC(this->immediate());
			return 2;
		case 0xEA:
			this->NOP();
			return 2;
		case 0xEC:
			this->CPX(this->absolute());
			return 4;
		case 0xED:
			this->SBC(this->absolute());
			return 4;
		case 0xEE:
			this->INC(this->absoluteAddress());
			return 6;
		case 0xF0:
			return 2 + this->BEQ();
		case 0xF1:
			this->SBC(this->indirectY(pageCrossed));
			return 5 + (pageCrossed ? 1 : 0);
		case 0xF5:
			this->SBC(this->zeropageX());
			return 4;
		case 0xF6:
			this->INC(this->zeropageXAddress());
			return 6;
		case 0xF8:
			this->SED();
			return 2;
		case 0xF9:
			this->SBC(this->absoluteY(pageCrossed));
			return 4 + (pageCrossed ? 1 : 0);
		case 0xFD:
			this->SBC(this->absoluteX(pageCrossed));
			return 4 + (pageCrossed ? 1 : 0);
		case 0xFE:
			this->INC(this->absoluteXAddress(pageCrossed));
			return 7;
		default:{
			throw std::invalid_argument("La instrucción de CPU ingresada no es valida");
			break;
		}
	}
}

uint8_t CPU::run_next_instruction(){
	uint8_t opcode = this->fetchByte();
	return this->execute_instruction(opcode);
}

int main(){
	
}
