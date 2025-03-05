#include <cstdint>
#include <stdexcept>
#include "Interface_Mem.h"

#ifndef RAM
#define RAM

class Ram : public InterfaceMemory{
	private:
		uint8_t* main_block;
		int mem_banks;
		int width;
		uint16_t map_address(const uint16_t& address) const;
	public:
		Ram(int width, int banks);
		void setByte(const uint16_t& address, const uint8_t& value) override;
		uint8_t getByte(const uint16_t& address) const override;
		~Ram() override;
};

#endif