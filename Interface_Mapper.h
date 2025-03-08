#include <cstdint>
#include <vector>

#pragma once

class Interface_Mapper{
	public:
		virtual void setPRGBlock(std::vector<uint8_t> PRGBlock) = 0;
		virtual void setCHRBlock(std::vector<uint8_t> CHRBlock) = 0;
		virtual ~Interface_Mapper() = default;
};