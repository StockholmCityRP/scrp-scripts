Citizen.CreateThread(function()
	for i = 1, 15 do
		EnableDispatchService(i, false)
	end
end)