#include <cstdint>
#include <iostream>
class Memory {
	char* main_block;
	int mem_banks;
	Memory(int width, int banks);
	~Memory();
	void setByte(const uint16_t& address, const char& value);
	char getByte(const uint16_t& address);
};

Memory::Memory(int width, int banks){
	this->main_block = new char[width];
	this->mem_banks = banks;
}

Memory::~Memory(){
	delete [](this->main_block);
}

void Memory::setByte(const uint16_t& address, const char& value){
	switch(address){
		case 0x0800 ... 0x1FFF: {
			uint16_t new_address = (address % 0x0800);
			
			break;
		}
		case 0x2008 ... 0x3FFF: {
			uint16_t new_address = (address % 0x0008) + 0x2000;
			std::cout<<std::hex<<new_address<<std::endl;
			break;
		}
		case 0xC000 ... 0xFFFF: {
			if(this->mem_banks == 1){
				uint16_t new_address = (address % 0x4000) + 0x8000;
				std::cout<<std::hex<<new_address<<std::endl;
				break;
			}
		}
		default: {
			std::cout<<std::hex<<address<<std::endl;
			break;
		}
	}
}

int main(){
	Memory my_mem(0x10000, 1);
	for(uint16_t i = 0x0000; i < 0xFFFF; i++){
		my_mem.setByte(i, 0);
	}
}