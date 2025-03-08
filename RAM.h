#include <cstdint>
#include <stdexcept>
#include "Interface_Mem.h"

#pragma once

class Ram : public InterfaceMemory{
	private:
		uint8_t* main_block;
		int width;
		uint16_t map_address(const uint16_t& address) const;
	public:
		Ram(int width = 0x0800);
		void setByte(const uint16_t& address, const uint8_t& value) override;
		uint8_t getByte(const uint16_t& address) const override;
		~Ram() override;
};
