#pragma once

class InterruptHandler{
	public:
		virtual void requestNMI() = 0;
		virtual void requestIRQ() = 0;
		virtual bool isNMIPending() = 0;
		virtual bool isIRQPending() = 0;
		virtual void clearNMI() = 0;
		virtual void clearIRQ() = 0;
		virtual ~InterruptHandler() = default;
};