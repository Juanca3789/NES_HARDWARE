#include "VRAM.h"

Vram::Vram(int width, int mirroring_mode) : width(width), mirroring_mode(mirroring_mode), vram_block(nullptr){
	if (this->width <= 0)
		throw std::invalid_argument("El tamano de la memoria debe ser un numero mayor a 0");
	this->vram_block = new uint8_t[this->width]();
}

uint16_t Vram::map_address(const uint16_t& address) const {
	switch(address){
		case 0x3000 ... 0x3EFF: return map_address((address % 0xF00) + 0x2000); 
	}
	if(this->mirroring_mode == 0){ //Mirroring horizontal
		switch(address){
			case 0x2800 ... 0x2BFF: return (address % 0x0400) + 0x2000;
			case 0x2C00 ... 0x2FFF: return (address % 0x0400) + 0x2400;
			default: return address;
		}
	}
	else if(this->mirroring_mode == 1){ //Mirrorin vertical
		switch(address){
			case 0x2400 ... 0x27FF: return (address % 0x0400) + 0x2000;
			case 0x2C00 ... 0x2FFF: return (address % 0x0400) + 0x2800;
			default: return address;
		}
	}
	else{
		return address;
	}
}

void Vram::setByte(const uint16_t& address, const uint8_t& value){
	if(address >= this->width)
		throw std::invalid_argument("Intento de acceso a una posicion de memoria ilegal");
	this->vram_block[this->map_address(address)] = value;
}

uint8_t Vram::getByte(const uint16_t& address) const {
	if(address >= this->width)
		throw std::invalid_argument("Intento de acceso a una posicion de memoria ilegal");
	
	return this->vram_block[this->map_address(address)];
}

Vram::~Vram(){
	delete[] (this->vram_block);
}