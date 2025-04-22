//
//  IntermediateMarathon.swift
//  Daily
//
//  Created by Michael Bautista on 4/21/25.
//

struct IntermediateMarathon {
    var program = [
        // MARK: Week 1
        [
            ProgramRun(distance: 4),
            ProgramRun(distance: 4),
            ProgramRun(distance: 4),
            ProgramRun(distance: 4),
            ProgramRun(distance: 4),
            ProgramRun(distance: 10)
        ],
        // MARK: Week 2
        [
            ProgramRun(distance: 4),
            ProgramRun(distance: 4),
            ProgramRun(distance: 4),
            ProgramRun(distance: 4),
            ProgramRun(distance: 4),
            ProgramRun(distance: 12)
        ],
        // MARK: Week 3
        [
            ProgramRun(distance: 5),
            ProgramRun(distance: 5),
            ProgramRun(workoutSegments: [
                RunSegment(
                    title: "Warmup",
                    description: "2 mile at an easy pace."
                ),
                RunSegment(
                    title: "Repeats",
                    description: "8 x 20 seconds at tempo pace, 40 seconds at an easy pace."
                ),
                RunSegment(
                    title: "Cooldown",
                    description: "2 mile at an easy pace."
                ),
            ]),
            ProgramRun(distance: 5),
            ProgramRun(distance: 4),
            ProgramRun(distance: 13)
        ],
        // MARK: Week 4
        [
            ProgramRun(distance: 5),
            ProgramRun(distance: 5),
            ProgramRun(workoutSegments: [
                RunSegment(
                    title: "Warmup",
                    description: "2 mile at an easy pace."
                ),
                RunSegment(
                    title: "Repeats",
                    description: "8 x 30 seconds at tempo pace, 60 seconds at an easy pace."
                ),
                RunSegment(
                    title: "Cooldown",
                    description: "2 mile at an easy pace."
                ),
            ]),
            ProgramRun(distance: 5),
            ProgramRun(distance: 4),
            ProgramRun(distance: 14)
        ],
        // MARK: Week 5
        [
            ProgramRun(distance: 6),
            ProgramRun(distance: 6),
            ProgramRun(workoutSegments: [
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
            ProgramRun(distance: 6),
            ProgramRun(distance: 4),
            ProgramRun(distance: 15)
        ],
        // MARK: Week 6
        [
            ProgramRun(distance: 6),
            ProgramRun(distance: 6),
            ProgramRun(workoutSegments: [
                RunSegment(
                    title: "Warmup",
                    description: "2 mile at an easy pace."
                ),
                RunSegment(
                    title: "Intervals",
                    description: "2 miles at tempo pace."
                ),
                RunSegment(
                    title: "Cooldown",
                    description: "2 mile at an easy pace."
                ),
            ]),
            ProgramRun(distance: 6),
            ProgramRun(distance: 4),
            ProgramRun(distance: 13)
        ],
        // MARK: Week 7
        [
            ProgramRun(distance: 7),
            ProgramRun(distance: 7),
            ProgramRun(workoutSegments: [
                RunSegment(
                    title: "Warmup",
                    description: "2 mile at an easy pace."
                ),
                RunSegment(
                    title: "Intervals",
                    description: "12 x 400m seconds at critical velocity pace. 30 seconds rest between each rep."
                ),
                RunSegment(
                    title: "Cooldown",
                    description: "2 mile at an easy pace."
                ),
            ]),
            ProgramRun(distance: 7),
            ProgramRun(distance: 4),
            ProgramRun(distance: 16)
        ],
        // MARK: Week 8
        [
            ProgramRun(distance: 7),
            ProgramRun(distance: 7),
            ProgramRun(workoutSegments: [
                RunSegment(
                    title: "Warmup",
                    description: "2 mile at an easy pace."
                ),
                RunSegment(
                    title: "Intervals",
                    description: "3 miles at tempo pace."
                ),
                RunSegment(
                    title: "Cooldown",
                    description: "2 mile at an easy pace."
                ),
            ]),
            ProgramRun(distance: 7),
            ProgramRun(distance: 4),
            ProgramRun(distance: 13)
        ],
        // MARK: Week 9
        [
            ProgramRun(distance: 7),
            ProgramRun(distance: 7),
            ProgramRun(workoutSegments: [
                RunSegment(
                    title: "Warmup",
                    description: "2 mile at an easy pace."
                ),
                RunSegment(
                    title: "Intervals",
                    description: "6 x 800m seconds at critical velocity pace. 60 seconds rest between each rep."
                ),
                RunSegment(
                    title: "Cooldown",
                    description: "2 mile at an easy pace."
                ),
            ]),
            ProgramRun(distance: 7),
            ProgramRun(distance: 4),
            ProgramRun(distance: 17)
        ],
        // MARK: Week 10
        [
            ProgramRun(distance: 7),
            ProgramRun(distance: 7),
            ProgramRun(workoutSegments: [
                RunSegment(
                    title: "Warmup",
                    description: "2 mile at an easy pace."
                ),
                RunSegment(
                    title: "Intervals",
                    description: "3 miles at tempo pace."
                ),
                RunSegment(
                    title: "Cooldown",
                    description: "2 mile at an easy pace."
                ),
            ]),
            ProgramRun(distance: 7),
            ProgramRun(distance: 4),
            ProgramRun(distance: 13)
        ],
        // MARK: Week 11
        [
            ProgramRun(distance: 8),
            ProgramRun(distance: 8),
            ProgramRun(workoutSegments: [
                RunSegment(
                    title: "Warmup",
                    description: "2 mile at an easy pace."
                ),
                RunSegment(
                    title: "Intervals",
                    description: "8 x 800m seconds at critical velocity pace. 60 seconds rest between each rep."
                ),
                RunSegment(
                    title: "Cooldown",
                    description: "2 mile at an easy pace."
                ),
            ]),
            ProgramRun(distance: 8),
            ProgramRun(distance: 4),
            ProgramRun(distance: 18)
        ],
        // MARK: Week 12
        [
            ProgramRun(distance: 8),
            ProgramRun(distance: 8),
            ProgramRun(workoutSegments: [
                RunSegment(
                    title: "Warmup",
                    description: "2 mile at an easy pace."
                ),
                RunSegment(
                    title: "Intervals",
                    description: "7 miles at tempo pace."
                ),
                RunSegment(
                    title: "Cooldown",
                    description: "2 mile at an easy pace."
                ),
            ]),
            ProgramRun(distance: 8),
            ProgramRun(distance: 4),
            ProgramRun(distance: 13)
        ],
        // MARK: Week 13
        [
            ProgramRun(distance: 8),
            ProgramRun(distance: 8),
            ProgramRun(workoutSegments: [
                RunSegment(
                    title: "Warmup",
                    description: "2 mile at an easy pace."
                ),
                RunSegment(
                    title: "Intervals",
                    description: "8 x 1000m seconds at critical velocity pace. 60 seconds rest between each rep."
                ),
                RunSegment(
                    title: "Cooldown",
                    description: "2 mile at an easy pace."
                ),
            ]),
            ProgramRun(distance: 8),
            ProgramRun(distance: 4),
            ProgramRun(distance: 20)
        ],
        // MARK: Week 14
        [
            ProgramRun(distance: 6),
            ProgramRun(distance: 6),
            ProgramRun(distance: 8),
            ProgramRun(distance: 6),
            ProgramRun(distance: 4),
            ProgramRun(distance: 12)
        ],
        // MARK: Week 15
        [
            ProgramRun(distance: 5),
            ProgramRun(distance: 5),
            ProgramRun(distance: 5),
            ProgramRun(distance: 5),
            ProgramRun(distance: 4),
            ProgramRun(distance: 8)
        ],
        // MARK: Week 16
        [
            ProgramRun(distance: 5),
            ProgramRun(distance: 5),
            ProgramRun(distance: 8),
            ProgramRun(distance: 0),
            ProgramRun(distance: 3),
            ProgramRun(distance: 2)
        ]
    ]
}
