#include "RAM.h"

Ram::Ram(int width) : width(width), main_block(nullptr){
	if (this->width <= 0)
		throw std::invalid_argument("El tamano de la memoria debe ser un numero mayor a 0");
	this->main_block = new uint8_t[this->width]();
}

uint16_t Ram::map_address(const uint16_t& address) const {
	return address % 0x0800;
}

void Ram::setByte(const uint16_t& address, const uint8_t& value) {
	this->main_block[this->map_address(address)] = value;
}

uint8_t Ram::getByte(const uint16_t& address) const{
	return this->main_block[this->map_address(address)];
}

Ram::~Ram(){
	delete[] (this->main_block);
}