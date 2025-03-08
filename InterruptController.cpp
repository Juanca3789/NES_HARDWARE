#include "InterruptController.h"

void InterruptController::requestNMI(){
	std::lock_guard<std::mutex> lock(this->interruptMutex);
	this->NMIPending = true;
}

void InterruptController::requestIRQ(){
	std::lock_guard<std::mutex> lock(this->interruptMutex);
	this->IRQPending = true;
}

void InterruptController::clearNMI(){
	std::lock_guard<std::mutex> lock(this->interruptMutex);
	this->NMIPending = false;
}

void InterruptController::clearIRQ(){
	std::lock_guard<std::mutex> lock(this->interruptMutex);
	this->IRQPending = false;
}

bool InterruptController::isNMIPending(){
	std::lock_guard<std::mutex> lock(this->interruptMutex);
	return this->NMIPending;
}

bool InterruptController::isIRQPending(){
	std::lock_guard<std::mutex> lock(this->interruptMutex);
	return this->IRQPending;
}
