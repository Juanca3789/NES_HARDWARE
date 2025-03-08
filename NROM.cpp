#include "NROM.h"

NROM::NROM(bool mirrored_16kB) : mirrored_16kB(mirrored_16kB){}

void NROM::setPRGBlock(std::vector<uint8_t> PRGBlock){
	
}

void NROM::setCHRBlock(std::vector<uint8_t> CHRBlock){
	
}

void NROM::setByte(const uint16_t& address, const uint8_t& value){
	
}

uint8_t NROM::getByte(const uint16_t& address) const{
	return 0;
}