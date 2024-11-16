local dfpwm = require("cc.audio.dfpwm")
local speaker = peripheral.find("speaker")


while true do
    local decoder = dfpwm.make_decoder()
    for chunk in io.lines("/songs/LHwYvRm2.wav", 16 * 1024) do
        local buffer = decoder(chunk)

        while not speaker.playAudio(buffer) do
            os.pullEvent("speaker_audio_empty")
        end
    end
end
