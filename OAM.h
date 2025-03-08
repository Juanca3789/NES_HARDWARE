#include <cstdint>
#include <stdexcept>
#include "Interface_Mem.h"

#pragma once

class Oam : public InterfaceMemory{
	private:
		uint8_t* oam_block;
		int width;
	public:
		Oam(int width);
		void setByte(const uint16_t& address, const uint8_t& value) override;
		uint8_t getByte(const uint16_t& address) const override;
		~Oam() override;
};