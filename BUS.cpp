#include <cstdint>
#include <mutex>
#include "Interface_Mem.cpp"

class Bus{
	private:
		InterfaceMemory* ram;
		uint8_t shared_registers[8];
		std::mutex reg_mutex;
	public:
		Bus(InterfaceMemory* ram);
		void cpuWrite(const uint16_t& address, const uint8_t& value);
		uint8_t cpuRead(const uint16_t& address);
};