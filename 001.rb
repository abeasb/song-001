# 001

use_bpm 60

lluvia = "C:/Users/adria/OneDrive/Escritorio/sonic pi/samples/lluvia.mp3"

define :alpha_waves do
  use_synth :sine
  play 50, attack: 2, sustain: 6, release: 2, amp: 0.5
  sleep 8
end

define :brown_noise do
  sample :ambi_haunted_hum, rate: 0.5, amp: 0.5
  sleep sample_duration(:ambi_haunted_hum) / 0.5
end

define :soft_melody do
  use_synth :hollow
  play choose(chord(:e3, :minor7)), attack: 2, sustain: 4, release: 2, amp: 0.35
  sleep 8
end

live_loop :alpha do
  alpha_waves
end

live_loop :brown, sync: :alpha do
  brown_noise
end

live_loop :radio_static do
  sample :vinyl_hiss, amp: 0.68
  sleep sample_duration(:vinyl_hiss)
end

live_loop :melody, sync: :alpha do
  soft_melody
end

live_loop :lluvia, sync: :alpha do
  sample lluvia, amp: 1, pitch: -12
  sleep sample_duration(lluvia)
end
