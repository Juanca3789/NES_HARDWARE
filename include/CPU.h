#include <cstdint>
#include <stdexcept>
#include "Interface_InterruptHandler.h"
#include "Interface_Mem.h"
#include "BUS.h"
#ifndef CPU_H
#define CPU_H

class CPU{
	private:
		Bus* bus;
		InterruptHandler* interruptHandler;
		uint16_t PC;
		uint8_t A;
		uint8_t X;
		uint8_t Y;
		uint8_t SP;
		uint8_t P;
		//Lectura y escritura en Memoria
		uint8_t fetchByte();
		uint16_t fetchAddress();
		uint16_t readAddress(const uint16_t& lowByte);
		void pushToStack(uint8_t value);
		uint8_t pullFromStack();
		//Instrucciones genericas
		uint8_t branchIf(const bool& condition);
		//Instrucciones de la CPU
		void ADC(const uint8_t& mode);
		void AND(const uint8_t& mode);
		void ASL();
		void ASL(const uint16_t& addressMode);
		uint8_t BCC();
		uint8_t BCS();
		uint8_t BEQ();
		void BIT(const uint16_t& addressMode);
		uint8_t BMI();
		uint8_t BNE();
		uint8_t BPL();
		void BRK();
		uint8_t BVC();
		uint8_t BVS();
		void CLC();
		void CLD();
		void CLI();
		void CLV();
		void CMP(const uint8_t& mode);
		void CPX(const uint8_t& mode);
		void CPY(const uint8_t& mode);
		void DEC(const uint16_t& addressMode);
		void DEX();
		void DEY();
		void EOR(const uint8_t& mode);
		void INC(const uint16_t& addressMode);
		void INX();
		void INY();
		void JMP();
		void JMP(const uint16_t& addressMode);
		void JSR();
		void LDA(const uint8_t& mode);
		void LDX(const uint8_t& mode);
		void LDY(const uint8_t& mode);
		void LSR();
		void LSR(const uint16_t& addressMode);
		void NOP();
		void ORA(const uint8_t& mode);
		void PHA();
		void PHP();
		void PLA();
		void PLP();
		void ROL();
		void ROL(const uint16_t& addressMode);
		void ROR();
		void ROR(const uint16_t& addressMode);
		void RTI();
		void RTS();
		void SBC(const uint8_t& mode);
		void SEC();
		void SED();
		void SEI();
		void STA(const uint16_t& addressMode);
		void STX(const uint16_t& addressMode);
		void STY(const uint16_t& addressMode);
		void TAX();
		void TAY();
		void TSX();
		void TXA();
		void TXS();
		void TYA();
		//Modos direccionamiento direccion
		uint16_t zeropageAddress();
		uint16_t zeropageXAddress();
		uint16_t zeropageYAddress();
		uint16_t absoluteAddress();
		uint16_t absoluteXAddress(bool& pageCrossed);
		uint16_t absoluteYAddress(bool& pageCrossed);
		uint16_t indirectXAddress();
		uint16_t indirectYAddress(bool& pageCrossed);
		//Modos de direccionamiento valor
		uint8_t immediate();
		uint8_t zeropage();
		uint8_t zeropageX();
		uint8_t zeropageY();
		uint8_t absolute();
		uint8_t absoluteX(bool& pageCrossed);
		uint8_t absoluteY(bool& pageCrossed);
		uint8_t indirectX();
		uint8_t indirectY(bool& pageCrossed);
		//Actualización de flags
		void updateZeroFlag(const uint8_t& result);
		void updateNegativeFlag(const uint8_t& result);
		void updateCarryFlag(const bool& carry);
		void updateOverflowFlag(const uint8_t& value_1, const uint8_t& value_2, const uint8_t& result);
		void updateInterruptFlag(const bool& value);
		void updateBFlag(const bool& value);
		//Ejecucion de interrupciones
		void handleInterrupt(uint16_t lowByte, bool isBRK);
		void NMIInterrupt();
		void IRQInterrupt();
		//Ejecucion principal
		uint8_t execute_instruction(const uint8_t& opcode);
	public:
		CPU(Bus* bus, InterruptHandler* interruptHandler);
		uint8_t run_next_instruction();
		~CPU(){}
};

#endif