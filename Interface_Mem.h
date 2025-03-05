#include<cstdint>
#ifndef INTERFACE_MEM
#define INTERFACE_MEM
class InterfaceMemory{
	public:
		virtual void setByte(const uint16_t& address, const uint8_t& value) = 0;
		virtual uint8_t getByte(const uint16_t& address) const = 0;
		virtual ~InterfaceMemory(){}
};
#endif