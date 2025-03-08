#include <cstdint>
#include <mutex>
#include "Interface_Mem.h"

#pragma once

class Bus{
	private:
		InterfaceMemory* ram;
		std::mutex reg_mutex;
	public:
		Bus(InterfaceMemory* ram);
		void cpuWrite(const uint16_t& address, const uint8_t& value);
		uint8_t cpuRead(const uint16_t& address);
		void ppuWriteRegister(const uint16_t& address, const uint8_t& value);
		uint8_t ppuReadRegister(const uint16_t& address);
		void triggerNMIInterrupt();
		~Bus();
};