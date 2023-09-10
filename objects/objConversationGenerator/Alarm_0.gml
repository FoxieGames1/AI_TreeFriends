if buffer_exists(Buffer)
{
	buffer_seek(Buffer, buffer_seek_start, 0) network_send_udp_raw(Socket, "localhost", PortToReciveMessages, Buffer, 100);
}

if Event = 1
{
	Texto = "<Put Other Message>"
	Event = 2
}

if (BufferList < Buff)
{
	show_debug_message("Buffer: "+string(Buff))
	show_debug_message("listNumber: "+string(listNumber))
	
	if listNumber != 0
	{
		NicksPending[listNumber] = NickDetected
		TextPending[listNumber] = Responde
	}
	
	listNumber++
	BufferList += BufferCharge
	buffer_delete(Buffer)
	Buffer = -1
}

alarm[0] = 5