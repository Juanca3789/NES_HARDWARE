#include <cstdint>
#include <stdexcept>
#include "Interface_Mem.h"

#pragma once

class Vram : public InterfaceMemory{
	private:
		uint8_t* vram_block;
		int mirroring_mode;
		int width;
		uint16_t map_address(const uint16_t& address) const;
	public:
		Vram(int width, int mirroring_mode);
		void setByte(const uint16_t& address, const uint8_t& value) override;
		uint8_t getByte(const uint16_t& address) const override;
		~Vram() override;
};
