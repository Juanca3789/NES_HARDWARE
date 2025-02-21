#include <cstdint>
#include <stdexcept>
#include "Interface_Mem.cpp"

class Oam : public InterfaceMemory{
	private:
		uint8_t* oam_block;
		int width;
	public:
		Oam(int width);
		void setByte(const uint16_t& address, const uint8_t& value) override;
		uint8_t getByte(const uint16_t& address) const override;
		~Oam() override;
};

Oam::Oam(int width) : width(width), oam_block(nullptr){
	if (this->width <= 0)
		throw std::invalid_argument("El tamano de la memoria debe ser un numero mayor a 0");
	this->oam_block = new uint8_t[this->width]();
}

void Oam::setByte(const uint16_t& address, const uint8_t& value){
	if(address >= this->width)
		throw std::invalid_argument("Intento de acceso a una posicion de memoria ilegal");
	this->oam_block[address] = value;
}

uint8_t Oam::getByte(const uint16_t& address) const {
	if(address >= this->width)
		throw std::invalid_argument("Intento de acceso a una posicion de memoria ilegal");
	
	return this->oam_block[address];
}

Oam::~Oam(){
	delete[] (this->oam_block);
}