//
//  AdvancedMarathon.swift
//  Daily
//
//  Created by Michael Bautista on 4/21/25.
//

class AdvancedMarathon {
    
    public static let shared = AdvancedMarathon()
    
    var weeks = [
        // Week 1
        ProgramWeek(
            week: 1,
            runs: [
                ProgramRun(type: .EasyRun, distance: 5),
                ProgramRun(type: .EasyRun, distance: 5),
                ProgramRun(type: .EasyRun, distance: 5),
                ProgramRun(type: .EasyRun, distance: 5),
                ProgramRun(type: .EasyRun, distance: 5),
                ProgramRun(type: .LongRun, distance: 11),
                ProgramRun(type: .Rest, distance: 0)
            ]
        ),
        // Week 2
        ProgramWeek(
            week: 2,
            runs: [
                ProgramRun(type: .EasyRun, distance: 5),
                ProgramRun(type: .EasyRun, distance: 5),
                ProgramRun(type: .EasyRun, distance: 5),
                ProgramRun(type: .EasyRun, distance: 5),
                ProgramRun(type: .EasyRun, distance: 5),
                ProgramRun(type: .LongRun, distance: 12),
                ProgramRun(type: .Rest, distance: 0)
            ]
        ),
        // Week 3
        ProgramWeek(
            week: 3,
            runs: [
                ProgramRun(type: .EasyRun, distance: 6),
                ProgramRun(type: .EasyRun, distance: 6),
                ProgramRun(type: .SpeedWorkout, workoutSegments: [
                    RunSegment(
                        title: "Warmup",
                        description: "2 miles at an easy pace."
                    ),
                    RunSegment(
                        title: "Repeats",
                        description: "8 x 30 seconds at tempo pace, 60 seconds at an easy pace."
                    ),
                    RunSegment(
                        title: "Cooldown",
                        description: "2 miles at an easy pace."
                    ),
                ]),
                ProgramRun(type: .EasyRun, distance: 6),
                ProgramRun(type: .EasyRun, distance: 3),
                ProgramRun(type: .LongRun, distance: 14),
                ProgramRun(type: .Rest, distance: 0)
            ]
        ),
        // Week 4
        ProgramWeek(
            week: 4,
            runs: [
                ProgramRun(type: .EasyRun, distance: 6),
                ProgramRun(type: .EasyRun, distance: 6),
                ProgramRun(type: .SpeedWorkout, workoutSegments: [
                    RunSegment(
                        title: "Warmup",
                        description: "2 miles at an easy pace."
                    ),
                    RunSegment(
                        title: "Repeats",
                        description: "8 x 60 seconds at tempo pace, 2 minutes at an easy pace."
                    ),
                    RunSegment(
                        title: "Cooldown",
                        description: "2 miles at an easy pace."
                    ),
                ]),
                ProgramRun(type: .EasyRun, distance: 6),
                ProgramRun(type: .EasyRun, distance: 3),
                ProgramRun(type: .LongRun, distance: 15),
                ProgramRun(type: .Rest, distance: 0)
            ]
        ),
        // Week 5
        ProgramWeek(
            week: 5,
            runs: [
                ProgramRun(type: .EasyRun, distance: 7),
                ProgramRun(type: .EasyRun, distance: 7),
                ProgramRun(type: .SpeedWorkout, workoutSegments: [
                    RunSegment(
                        title: "Warmup",
                        description: "2 miles at an easy pace."
                    ),
                    RunSegment(
                        title: "Intervals",
                        description: "12 x 400m seconds at critical velocity pace. 30 seconds rest between each rep."
                    ),
                    RunSegment(
                        title: "Cooldown",
                        description: "2 miles at an easy pace."
                    ),
                ]),
                ProgramRun(type: .EasyRun, distance: 7),
                ProgramRun(type: .EasyRun, distance: 5),
                ProgramRun(type: .LongRun, distance: 16),
                ProgramRun(type: .Rest, distance: 0)
            ]
        ),
        // Week 6
        ProgramWeek(
            week: 6,
            runs: [
                ProgramRun(type: .EasyRun, distance: 7),
                ProgramRun(type: .EasyRun, distance: 7),
                ProgramRun(type: .SpeedWorkout, workoutSegments: [
                    RunSegment(
                        title: "Warmup",
                        description: "2 miles at an easy pace."
                    ),
                    RunSegment(
                        title: "Tempo",
                        description: "3 miles at tempo pace."
                    ),
                    RunSegment(
                        title: "Cooldown",
                        description: "2 miles at an easy pace."
                    ),
                ]),
                ProgramRun(type: .EasyRun, distance: 7),
                ProgramRun(type: .EasyRun, distance: 5),
                ProgramRun(type: .LongRun, distance: 15),
                ProgramRun(type: .Rest, distance: 0)
            ]
        ),
        // Week 7
        ProgramWeek(
            week: 7,
            runs: [
                ProgramRun(type: .EasyRun, distance: 8),
                ProgramRun(type: .EasyRun, distance: 8),
                ProgramRun(type: .SpeedWorkout, workoutSegments: [
                    RunSegment(
                        title: "Warmup",
                        description: "2 miles at an easy pace."
                    ),
                    RunSegment(
                        title: "Intervals",
                        description: "16 x 400m seconds at critical velocity pace. 30 seconds rest between each rep."
                    ),
                    RunSegment(
                        title: "Cooldown",
                        description: "2 miles at an easy pace."
                    ),
                ]),
                ProgramRun(type: .EasyRun, distance: 8),
                ProgramRun(type: .EasyRun, distance: 5),
                ProgramRun(type: .LongRun, distance: 18),
                ProgramRun(type: .Rest, distance: 0)
            ]
        ),
        // Week 8
        ProgramWeek(
            week: 8,
            runs: [
                ProgramRun(type: .EasyRun, distance: 8),
                ProgramRun(type: .EasyRun, distance: 8),
                ProgramRun(type: .SpeedWorkout, workoutSegments: [
                    RunSegment(
                        title: "Warmup",
                        description: "2 miles at an easy pace."
                    ),
                    RunSegment(
                        title: "Tempo",
                        description: "4 miles at tempo pace."
                    ),
                    RunSegment(
                        title: "Cooldown",
                        description: "2 miles at an easy pace."
                    ),
                ]),
                ProgramRun(type: .EasyRun, distance: 8),
                ProgramRun(type: .EasyRun, distance: 5),
                ProgramRun(type: .LongRun, distance: 15),
                ProgramRun(type: .Rest, distance: 0)
            ]
        ),
        // Week 9
        ProgramWeek(
            week: 9,
            runs: [
                ProgramRun(type: .EasyRun, distance: 8),
                ProgramRun(type: .EasyRun, distance: 8),
                ProgramRun(type: .SpeedWorkout, workoutSegments: [
                    RunSegment(
                        title: "Warmup",
                        description: "2 miles at an easy pace."
                    ),
                    RunSegment(
                        title: "Intervals",
                        description: "8 x 800m seconds at critical velocity pace. 60 seconds rest between each rep."
                    ),
                    RunSegment(
                        title: "Cooldown",
                        description: "2 miles at an easy pace."
                    ),
                ]),
                ProgramRun(type: .EasyRun, distance: 8),
                ProgramRun(type: .EasyRun, distance: 5),
                ProgramRun(type: .LongRun, distance: 19),
                ProgramRun(type: .Rest, distance: 0)
            ]
        ),
        // Week 10
        ProgramWeek(
            week: 10,
            runs: [
                ProgramRun(type: .EasyRun, distance: 8),
                ProgramRun(type: .EasyRun, distance: 8),
                ProgramRun(type: .SpeedWorkout, workoutSegments: [
                    RunSegment(
                        title: "Warmup",
                        description: "2 miles at an easy pace."
                    ),
                    RunSegment(
                        title: "Tempo",
                        description: "4 miles at tempo pace."
                    ),
                    RunSegment(
                        title: "Cooldown",
                        description: "2 miles at an easy pace."
                    ),
                ]),
                ProgramRun(type: .EasyRun, distance: 8),
                ProgramRun(type: .EasyRun, distance: 5),
                ProgramRun(type: .LongRun, distance: 15),
                ProgramRun(type: .Rest, distance: 0)
            ]
        ),
        // Week 11
        ProgramWeek(
            week: 11,
            runs: [
                ProgramRun(type: .EasyRun, distance: 9),
                ProgramRun(type: .EasyRun, distance: 9),
                ProgramRun(type: .SpeedWorkout, workoutSegments: [
                    RunSegment(
                        title: "Warmup",
                        description: "2 miles at an easy pace."
                    ),
                    RunSegment(
                        title: "Intervals",
                        description: "10 x 800m seconds at critical velocity pace. 60 seconds rest between each rep."
                    ),
                    RunSegment(
                        title: "Cooldown",
                        description: "2 miles at an easy pace."
                    ),
                ]),
                ProgramRun(type: .EasyRun, distance: 9),
                ProgramRun(type: .EasyRun, distance: 5),
                ProgramRun(type: .LongRun, distance: 20),
                ProgramRun(type: .Rest, distance: 0)
            ]
        ),
        // Week 12
        ProgramWeek(
            week: 12,
            runs: [
                ProgramRun(type: .EasyRun, distance: 9),
                ProgramRun(type: .EasyRun, distance: 9),
                ProgramRun(type: .SpeedWorkout, workoutSegments: [
                    RunSegment(
                        title: "Warmup",
                        description: "2 miles at an easy pace."
                    ),
                    RunSegment(
                        title: "Tempo",
                        description: "9 miles at tempo pace."
                    ),
                    RunSegment(
                        title: "Cooldown",
                        description: "2 miles at an easy pace."
                    ),
                ]),
                ProgramRun(type: .EasyRun, distance: 9),
                ProgramRun(type: .EasyRun, distance: 5),
                ProgramRun(type: .LongRun, distance: 15),
                ProgramRun(type: .Rest, distance: 0)
            ]
        ),
        // Week 13
        ProgramWeek(
            week: 13,
            runs: [
                ProgramRun(type: .EasyRun, distance: 9),
                ProgramRun(type: .EasyRun, distance: 10),
                ProgramRun(type: .SpeedWorkout, workoutSegments: [
                    RunSegment(
                        title: "Warmup",
                        description: "2 miles at an easy pace."
                    ),
                    RunSegment(
                        title: "Intervals",
                        description: "8 x 1000m seconds at critical velocity pace. 60 seconds rest between each rep."
                    ),
                    RunSegment(
                        title: "Cooldown",
                        description: "2 miles at an easy pace."
                    ),
                ]),
                ProgramRun(type: .EasyRun, distance: 10),
                ProgramRun(type: .EasyRun, distance: 5),
                ProgramRun(type: .LongRun, distance: 22),
                ProgramRun(type: .Rest, distance: 0)
            ]
        ),
        // Week 14
        ProgramWeek(
            week: 14,
            runs: [
                ProgramRun(type: .EasyRun, distance: 7),
                ProgramRun(type: .EasyRun, distance: 7),
                ProgramRun(type: .SpeedWorkout, workoutSegments: [
                    RunSegment(
                        title: "Warmup",
                        description: "2 miles at an easy pace."
                    ),
                    RunSegment(
                        title: "Tempo",
                        description: "6 miles at tempo pace."
                    ),
                    RunSegment(
                        title: "Cooldown",
                        description: "2 miles at an easy pace."
                    ),
                ]),
                ProgramRun(type: .EasyRun, distance: 7),
                ProgramRun(type: .EasyRun, distance: 5),
                ProgramRun(type: .LongRun, distance: 14),
                ProgramRun(type: .Rest, distance: 0)
            ]
        ),
        // Week 15
        ProgramWeek(
            week: 15,
            runs: [
                ProgramRun(type: .EasyRun, distance: 6),
                ProgramRun(type: .EasyRun, distance: 6),
                ProgramRun(type: .EasyRun, distance: 6),
                ProgramRun(type: .EasyRun, distance: 6),
                ProgramRun(type: .EasyRun, distance: 5),
                ProgramRun(type: .LongRun, distance: 10),
                ProgramRun(type: .Rest, distance: 0)
            ]
        ),
        // Week 16
        ProgramWeek(
            week: 16,
            runs: [
                ProgramRun(type: .EasyRun, distance: 5),
                ProgramRun(type: .EasyRun, distance: 5),
                ProgramRun(type: .SpeedWorkout, workoutSegments: [
                    RunSegment(
                        title: "Warmup",
                        description: "2 miles at an easy pace."
                    ),
                    RunSegment(
                        title: "Intervals",
                        description: "8 x 800m seconds at critical velocity pace. 60 seconds rest between each rep."
                    ),
                    RunSegment(
                        title: "Cooldown",
                        description: "2 miles at an easy pace."
                    ),
                ]),
                ProgramRun(type: .EasyRun, distance: 0),
                ProgramRun(type: .EasyRun, distance: 4),
                ProgramRun(type: .EasyRun, distance: 2),
                ProgramRun(type: .Race, distance: 0)
            ]
        )
    ]
}
