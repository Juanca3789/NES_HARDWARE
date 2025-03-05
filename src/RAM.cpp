#include "RAM.h"

Ram::Ram(int width, int banks) : width(width), mem_banks(banks), main_block(nullptr){
	if (this->width <= 0)
		throw std::invalid_argument("El tamano de la memoria debe ser un numero mayor a 0");
	
	this->main_block = new uint8_t[this->width]();
}

uint16_t Ram::map_address(const uint16_t& address) const {
	switch(address){
		case 0x0800 ... 0x1FFF: return (address % 0x0800);
		case 0x2008 ... 0x3FFF: return (address % 0x0008) + 0x2000;
		case 0xC000 ... 0xFFFF: return this->mem_banks == 1 ? (address % 0x4000) + 0x8000 : address;
		default: return address;
	}
}

void Ram::setByte(const uint16_t& address, const uint8_t& value) {
	if(address >= this->width)
		throw std::invalid_argument("Intento de acceso a una posicion de memoria ilegal");
	
	this->main_block[this->map_address(address)] = value;
}

uint8_t Ram::getByte(const uint16_t& address) const{
	if(address >= this->width)
		throw std::invalid_argument("Intento de acceso a una posicion de memoria ilegal");
	
	return this->main_block[this->map_address(address)];
}

Ram::~Ram(){
	delete[] (this->main_block);
}