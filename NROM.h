#include <stdexcept>
#include "Interface_Mapper.h"
#include "Interface_Mem.h"

#pragma once

class NROM : public Interface_Mapper, public InterfaceMemory{
	private:
		std::vector<uint8_t> PRGBlock;
		std::vector<uint8_t> CHRBlock;
		bool mirrored_16kB;
	public:
		NROM(bool mirrored_16kB);
		void setPRGBlock(std::vector<uint8_t> PRGBlock) override;
		void setCHRBlock(std::vector<uint8_t> CHRBlock) override;
		void setByte(const uint16_t& address, const uint8_t& value) override;
		uint8_t getByte(const uint16_t& address) const override;
		~NROM() override = default;
};