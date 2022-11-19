class Goal < ApplicationRecord
  DEFAULT_GOALS = [
                    "Buy clothes in any store", "Walk in high heels", "Cross my legs", "Go up hills/stairs easily", "Sit comfortably in traffic", "Walk/run a 10k", "Tie my shoes",
                    "Bathe in a bathtub", "Be more active/exercise", "Play with my children", "Ride carnival rides", "Be more outgoing", "Build my confidence", "Be happier",
                    "Get pregnant", "Live longer", "Reduce pain my knees", "No longer have sleep apnoea", "No longer have diabetes"
                  ]
  belongs_to :user
end
