//
//  IntermediateHalfMarathon.swift
//  Daily
//
//  Created by Michael Bautista on 4/22/25.
//

class IntermediateHalfMarathon {
    
    public static let shared = IntermediateHalfMarathon()
    
    var weeks = [
        // Week 1
        ProgramWeek(
            week: 1,
            runs: [
                ProgramRun(type: .EasyRun, distance: 4),
                ProgramRun(type: .EasyRun, distance: 4),
                ProgramRun(type: .EasyRun, distance: 4),
                ProgramRun(type: .EasyRun, distance: 4),
                ProgramRun(type: .EasyRun, distance: 4),
                ProgramRun(type: .LongRun, distance: 8),
                ProgramRun(type: .Rest, distance: 0)
            ]
        ),
        // Week 2
        ProgramWeek(
            week: 2,
            runs: [
                ProgramRun(type: .EasyRun, distance: 4),
                ProgramRun(type: .EasyRun, distance: 4),
                ProgramRun(type: .EasyRun, distance: 4),
                ProgramRun(type: .EasyRun, distance: 4),
                ProgramRun(type: .EasyRun, distance: 4),
                ProgramRun(type: .LongRun, distance: 9),
                ProgramRun(type: .Rest, distance: 0)
            ]
        ),
        // Week 3
        ProgramWeek(
            week: 3,
            runs: [
                ProgramRun(type: .EasyRun, distance: 5),
                ProgramRun(type: .EasyRun, distance: 5),
                ProgramRun(type: .SpeedWorkout, workoutSegments: [
                    RunSegment(
                        title: "Warmup",
                        description: "10-15 minutes at an easy pace."
                    ),
                    RunSegment(
                        title: "Repeats",
                        description: "8 x 20 seconds at tempo pace, 40 seconds at an easy pace."
                    ),
                    RunSegment(
                        title: "Cooldown",
                        description: "10-15 minutes at an easy pace."
                    ),
                ]),
                ProgramRun(type: .EasyRun, distance: 5),
                ProgramRun(type: .EasyRun, distance: 4),
                ProgramRun(type: .LongRun, distance: 10),
                ProgramRun(type: .Rest, distance: 0)
            ]
        ),
        // Week 4
        ProgramWeek(
            week: 4,
            runs: [
                ProgramRun(type: .EasyRun, distance: 5),
                ProgramRun(type: .EasyRun, distance: 5),
                ProgramRun(type: .SpeedWorkout, workoutSegments: [
                    RunSegment(
                        title: "Warmup",
                        description: "10-15 minutes at an easy pace."
                    ),
                    RunSegment(
                        title: "Repeats",
                        description: "8 x 30 seconds at tempo pace, 60 seconds at an easy pace."
                    ),
                    RunSegment(
                        title: "Cooldown",
                        description: "10-15 minutes at an easy pace."
                    ),
                ]),
                ProgramRun(type: .EasyRun, distance: 5),
                ProgramRun(type: .EasyRun, distance: 4),
                ProgramRun(type: .LongRun, distance: 8),
                ProgramRun(type: .Rest, distance: 0)
            ]
        ),
        // Week 5
        ProgramWeek(
            week: 5,
            runs: [
                ProgramRun(type: .EasyRun, distance: 6),
                ProgramRun(type: .EasyRun, distance: 6),
                ProgramRun(type: .SpeedWorkout, workoutSegments: [
                    RunSegment(
                        title: "Warmup",
                        description: "2 mile at an easy pace."
                    ),
                    RunSegment(
                        title: "Intervals",
                        description: "8 x 400m seconds at critical velocity pace. 30 seconds rest between each rep."
                    ),
                    RunSegment(
                        title: "Cooldown",
                        description: "2 mile at an easy pace."
                    ),
                ]),
                ProgramRun(type: .EasyRun, distance: 6),
                ProgramRun(type: .EasyRun, distance: 4),
                ProgramRun(type: .LongRun, distance: 11),
                ProgramRun(type: .Rest, distance: 0)
            ]
        ),
        // Week 6
        ProgramWeek(
            week: 6,
            runs: [
                ProgramRun(type: .EasyRun, distance: 6),
                ProgramRun(type: .EasyRun, distance: 6),
                ProgramRun(type: .SpeedWorkout, workoutSegments: [
                    RunSegment(
                        title: "Warmup",
                        description: "2 miles at an easy pace."
                    ),
                    RunSegment(
                        title: "Tempo",
                        description: "2 miles at tempo pace."
                    ),
                    RunSegment(
                        title: "Cooldown",
                        description: "2 miles at an easy pace."
                    ),
                ]),
                ProgramRun(type: .EasyRun, distance: 6),
                ProgramRun(type: .EasyRun, distance: 4),
                ProgramRun(type: .LongRun, distance: 12),
                ProgramRun(type: .Rest, distance: 0)
            ]
        ),
        // Week 7
        ProgramWeek(
            week: 7,
            runs: [
                ProgramRun(type: .EasyRun, distance: 6),
                ProgramRun(type: .EasyRun, distance: 6),
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
                ProgramRun(type: .EasyRun, distance: 6),
                ProgramRun(type: .EasyRun, distance: 4),
                ProgramRun(type: .LongRun, distance: 10),
                ProgramRun(type: .Rest, distance: 0)
            ]
        ),
        // Week 8
        ProgramWeek(
            week: 8,
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
                ProgramRun(type: .EasyRun, distance: 4),
                ProgramRun(type: .LongRun, distance: 14),
                ProgramRun(type: .Rest, distance: 0)
            ]
        ),
        // Week 9
        ProgramWeek(
            week: 9,
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
                        description: "6 x 800m seconds at critical velocity pace. 60 seconds rest between each rep."
                    ),
                    RunSegment(
                        title: "Cooldown",
                        description: "2 miles at an easy pace."
                    ),
                ]),
                ProgramRun(type: .EasyRun, distance: 7),
                ProgramRun(type: .EasyRun, distance: 4),
                ProgramRun(type: .LongRun, distance: 10),
                ProgramRun(type: .Rest, distance: 0)
            ]
        ),
        // Week 10
        ProgramWeek(
            week: 10,
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
                ProgramRun(type: .EasyRun, distance: 4),
                ProgramRun(type: .LongRun, distance: 14),
                ProgramRun(type: .Rest, distance: 0)
            ]
        ),
        // Week 11
        ProgramWeek(
            week: 11,
            runs: [
                ProgramRun(type: .EasyRun, distance: 4),
                ProgramRun(type: .EasyRun, distance: 4),
                ProgramRun(type: .EasyRun, distance: 3),
                ProgramRun(type: .EasyRun, distance: 3),
                ProgramRun(type: .EasyRun, distance: 4),
                ProgramRun(type: .LongRun, distance: 8),
                ProgramRun(type: .Rest, distance: 0)
            ]
        ),
        // Week 12
        ProgramWeek(
            week: 12,
            runs: [
                ProgramRun(type: .EasyRun, distance: 4),
                ProgramRun(type: .EasyRun, distance: 4),
                ProgramRun(type: .EasyRun, distance: 6),
                ProgramRun(type: .Rest, distance: 0),
                ProgramRun(type: .EasyRun, distance: 3),
                ProgramRun(type: .EasyRun, distance: 2),
                ProgramRun(type: .Race, distance: 0)
            ]
        )
    ]
}
