#include "NROM.h"

NROM::NROM(bool mirrored_16kB, bool mirrored_4kb, bool chr_ram, MirrorMode initial_mode) : 
	mirrored_16kB(mirrored_16kB), 
	mirrored_4kb(mirrored_4kb), 
	chr_ram(chr_ram), 
	mode(initial_mode){}

void NROM::setPRGBlock(std::vector<uint8_t>&& PRGBlock){
	this->PRGBlock = std::move(PRGBlock);
}

void NROM::setCHRBlock(std::vector<uint8_t>&& CHRBlock){
	this->CHRBlock = std::move(CHRBlock);
}

uint16_t NROM::mapPRGAddress(const uint16_t& address) const{
	if(address < 0x8000){
		throw std::invalid_argument("La dirección indicada está fuera del rango del mapper");
	}
	if(this->mirrored_16kB){
		return (address % 0x4000); 
	}
	return address - 0x8000;
}

uint16_t NROM::mapCHRAddress(const uint16_t& address) const{
	if(address >= 0x2000){
		throw std::invalid_argument("La dirección indicada está fuera del rango de la CHR-ROM");
	}
	if(this->mirrored_4kb){
		return (address % 0x1000);
	}
	return address;
}

void NROM::setCHRByte(const uint16_t& address, const uint8_t& value){
	if(!this->chr_ram){
		throw std::logic_error("Intento de escritura en CHR-ROM ilegal");
	}
	if(this->CHRBlock.empty()){
		throw std::runtime_error("La CHR-RAM no se encuentra asignada");
	}
	this->CHRBlock[this->mapCHRAddress(address)] = value;
}

uint8_t NROM::getCHRByte(const uint16_t& address) const{
	if(this->CHRBlock.empty()){
		throw std::runtime_error("El CHR-ROM/RAM se encuentra vacío");
	}
	return this->CHRBlock.data()[this->mapCHRAddress(address)];
}

void NROM::setMirrorMode(MirrorMode mode){
	throw std::logic_error("Cambio de espejado no soportado");
}

MirrorMode NROM::getMirrorMode() const{
	return this->mode;
}

void NROM::setByte(const uint16_t& address, const uint8_t& value){
	throw std::logic_error("Intento de escritura en PRG-ROM ilegal");
}

uint8_t NROM::getByte(const uint16_t& address) const{
	if(this->PRGBlock.empty()){
		throw std::runtime_error("El PRG-ROM se encuentra vacío");
	}
	return this->PRGBlock.data()[this->mapPRGAddress(address)];
}
