#include <stdexcept>
#include "Interface_Mapper.h"
#include "Interface_Mem.h"

#pragma once

class NROM : public Interface_Mapper, public InterfaceMemory{
	private:
		std::vector<uint8_t> PRGBlock;
		std::vector<uint8_t> CHRBlock;
		uint16_t mapPRGAddress(const uint16_t& address) const;
		uint16_t mapCHRAddress(const uint16_t& address) const;
		bool mirrored_16kB;
		bool mirrored_4kb;
		bool chr_ram;
		MirrorMode mode;
	public:
		NROM(bool mirrored_16kB, bool mirrored_4kb, bool chr_ram, MirrorMode initial_mode);
		void setPRGBlock(std::vector<uint8_t>&& PRGBlock) override;
		void setCHRBlock(std::vector<uint8_t>&& CHRBlock) override;
		void setCHRByte(const uint16_t& address, const uint8_t& value) override;
		uint8_t getCHRByte(const uint16_t& address) const override;
		void setByte(const uint16_t& address, const uint8_t& value) override;
		uint8_t getByte(const uint16_t& address) const override;
		void setMirrorMode(MirrorMode mode) override;
		MirrorMode getMirrorMode() const override;
		~NROM() override = default;
};