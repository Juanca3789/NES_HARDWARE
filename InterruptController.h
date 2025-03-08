#include <mutex>
#include "Interface_InterruptHandler.h"

#pragma once

class InterruptController : public InterruptHandler{
	private:
		bool NMIPending = false;
		bool IRQPending = false;
		std::mutex interruptMutex;
	public:
		void requestNMI() override;
		void requestIRQ() override;
		bool isNMIPending() override;
		bool isIRQPending() override;
		void clearNMI() override;
		void clearIRQ() override;
		~InterruptController() override = default;
};