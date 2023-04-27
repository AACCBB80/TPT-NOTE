--You must install .NET 7.0 or higher to use NOTE.
--dont edit sound.bat else it will break NOTE
--rn im working on another version that doesn't require anything execpt windows
if (fs.exists('sound.bat') == false) then
os.execute('echo start /MIN powershell "[console]::beep(%1 , %2)" >sound.bat')
os.execute('echo exit>>sound.bat')
end
elem.allocate("NOTE", "NOTE")
elem.element(elem.NOTE_PT_NOTE, elem.element(elem.DEFAULT_PT_DMND))
elem.property(elem.NOTE_PT_NOTE, "Name", "NOTE")
elem.property(elem.NOTE_PT_NOTE, "Description", "Note. Makes sound when powered. Change pitch with temp. Change duration with tmp. (Use sparingly)")
elem.property(elem.NOTE_PT_NOTE, "Colour", 0xd1d8a3)
elem.property(elem.NOTE_PT_NOTE, "MenuVisible", 1)
elem.property(elem.NOTE_PT_NOTE, "MenuSection", SC_ELEC)
elem.property(elem.NOTE_PT_NOTE, "Advection", 0)
elem.property(elem.NOTE_PT_NOTE, "AirDrag", 0)
elem.property(elem.NOTE_PT_NOTE, "AirLoss", 0.9)
elem.property(elem.NOTE_PT_NOTE, "Loss", 0)
elem.property(elem.NOTE_PT_NOTE, "Collision", 0)
elem.property(elem.NOTE_PT_NOTE, "Gravity", 0)
elem.property(elem.NOTE_PT_NOTE, "Diffusion", 0)
elem.property(elem.NOTE_PT_NOTE, "HotAir", 0)
elem.property(elem.NOTE_PT_NOTE, "Explosive", 0)
elem.property(elem.NOTE_PT_NOTE, "Flammable", 0)
elem.property(elem.NOTE_PT_NOTE, "Hardness", 0)
elem.property(elem.NOTE_PT_NOTE, "Meltable", 0)
elem.property(elem.NOTE_PT_NOTE, "Weight", 0)
elem.property(elem.NOTE_PT_NOTE, "HeatConduct", 0)
elem.property(elem.NOTE_PT_NOTE, "Temperature", 295.15)
elem.property(elem.NOTE_PT_NOTE, "Falldown", 0)
elem.property(elem.NOTE_PT_NOTE, "State", elem.ST_SOLID)
elem.property(elem.NOTE_PT_NOTE, "Properties", elem.TYPE_SOLID)
elem.property(elem.NOTE_PT_NOTE, "LowPressure", IPL)
elem.property(elem.NOTE_PT_NOTE, "LowPressureTransition", NT)
elem.property(elem.NOTE_PT_NOTE, "HighPressure", IPH)
elem.property(elem.NOTE_PT_NOTE, "HighPressureTransition", NT)
elem.property(elem.NOTE_PT_NOTE, "LowTemperature", ITL)
elem.property(elem.NOTE_PT_NOTE, "LowTemperatureTransition", NT)
elem.property(elem.NOTE_PT_NOTE, "HighTemperature", ITH)
elem.property(elem.NOTE_PT_NOTE, "HighTemperatureTransition", NT)
elem.property(elem.NOTE_PT_NOTE, "Update", function(id, x, y, ss, nt)
       for r in sim.neighbors(x, y, 1, 1) do
        local type = sim.partProperty(r, sim.FIELD_TYPE)
            if (type == elem.DEFAULT_PT_SPRK) and sim.partProperty(r, sim.FIELD_LIFE) == 0 then
				temp1 = sim.partProperty(id, "temp")
				tmp1 = sim.partProperty(id, "tmp") + 300
			  --os.execute('1.bat')
			  os.execute('start /MIN sound.bat '.. temp1 ..' '.. tmp1 ..'')
            end
            end
			end)