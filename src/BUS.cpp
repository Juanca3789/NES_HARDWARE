#include <stdexcept>
#include "Bus.h"

Bus::Bus(InterfaceMemory* ram) : ram(ram) {}

void Bus::cpuWrite(const uint16_t& address, const uint8_t& value){
	if(address >= 0x2000 && address <= 0x3FFF){
		std::lock_guard<std::mutex> lock(this->reg_mutex);
		this->ram->setByte(address, value);
	}
	else{
		this->ram->setByte(address, value);
	}
}

uint8_t Bus::cpuRead(const uint16_t& address){
	if(address >= 0x2000 && address <= 0x3FFF){
		std::lock_guard<std::mutex> lock(this->reg_mutex);
		return this->ram->getByte(address);
	}
	else{
		return this->ram->getByte(address);
	}
}

void Bus::ppuWriteRegister(const uint16_t& address, const uint8_t& value){
	if(!(address >= 0x2000 && address <= 0x3FFF)){
		throw std::invalid_argument("Lectura invalida, la PPU solo puede acceder a los registros dedicados entre 0x2000 y 0x3FFF");
	}
	std::lock_guard<std::mutex> lock(this->reg_mutex);
	this->ram->setByte(address, value);
}

uint8_t Bus::ppuReadRegister(const uint16_t& address){
	if(!(address >= 0x2000 && address <= 0x3FFF)){
		throw std::invalid_argument("Lectura invalida, la PPU solo puede acceder a los registros dedicados entre 0x2000 y 0x3FFF");
	}
	std::lock_guard<std::mutex> lock(this->reg_mutex);
	return this->ram->getByte(address);
}