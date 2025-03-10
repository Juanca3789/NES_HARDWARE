#include <cstdint>
#include <vector>
#include "MirrorMode.h"

#pragma once

class Interface_Mapper{
	public:
		virtual void setPRGBlock(std::vector<uint8_t>&& PRGBlock) = 0;
		virtual void setCHRBlock(std::vector<uint8_t>&& CHRBlock) = 0;
		virtual void setCHRByte(const uint16_t& address, const uint8_t& value) = 0;
		virtual uint8_t getCHRByte(const uint16_t& address) const = 0;
		virtual void setMirrorMode(MirrorMode mode) = 0;
		virtual MirrorMode getMirrorMode() const = 0;
		virtual ~Interface_Mapper() = default;
};