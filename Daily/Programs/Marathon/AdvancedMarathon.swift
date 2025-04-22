//
//  AdvancedMarathon.swift
//  Daily
//
//  Created by Michael Bautista on 4/21/25.
//

struct AdvancedMarathon {
    var program = [
        // Week 1
        [
            ProgramRun(distance: 5),
            ProgramRun(distance: 5),
            ProgramRun(distance: 5),
            ProgramRun(distance: 5),
            ProgramRun(distance: 5),
            ProgramRun(distance: 11)
        ],
        // Week 2
        [
            ProgramRun(distance: 5),
            ProgramRun(distance: 5),
            ProgramRun(distance: 5),
            ProgramRun(distance: 5),
            ProgramRun(distance: 5),
            ProgramRun(distance: 12)
        ],
        // Week 3
        [
            ProgramRun(distance: 6),
            ProgramRun(distance: 6),
            ProgramRun(workoutSegments: [
                RunSegment(
                    title: "Warmup",
                    description: "2 mile at an easy pace."
                ),
                RunSegment(
                    title: "Repeats",
                    description: "8 x 60 seconds at tempo pace, 60 seconds at an easy pace."
                ),
                RunSegment(
                    title: "Cooldown",
                    description: "2 mile at an easy pace."
                ),
            ]),
            ProgramRun(distance: 6),
            ProgramRun(distance: 3),
            ProgramRun(distance: 14)
        ],
        // Week 4
        [
            ProgramRun(distance: 6),
            ProgramRun(distance: 6),
            ProgramRun(workoutSegments: [
                RunSegment(
                    title: "Warmup",
                    description: "2 mile at an easy pace."
                ),
                RunSegment(
                    title: "Repeats",
                    description: "8 x 60 seconds at tempo pace, 60 seconds at an easy pace."
                ),
                RunSegment(
                    title: "Cooldown",
                    description: "2 mile at an easy pace."
                ),
            ]),
            ProgramRun(distance: 6),
            ProgramRun(distance: 3),
            ProgramRun(distance: 15)
        ],
        // Week 5
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
            ProgramRun(distance: 5),
            ProgramRun(distance: 16)
        ],
        // Week 6
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
            ProgramRun(distance: 5),
            ProgramRun(distance: 15)
        ],
        // Week 7
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
                    description: "16 x 400m seconds at critical velocity pace. 30 seconds rest between each rep."
                ),
                RunSegment(
                    title: "Cooldown",
                    description: "2 mile at an easy pace."
                ),
            ]),
            ProgramRun(distance: 8),
            ProgramRun(distance: 5),
            ProgramRun(distance: 18)
        ],
        // Week 8
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
                    description: "4 miles at tempo pace."
                ),
                RunSegment(
                    title: "Cooldown",
                    description: "2 mile at an easy pace."
                ),
            ]),
            ProgramRun(distance: 8),
            ProgramRun(distance: 5),
            ProgramRun(distance: 15)
        ],
        // Week 9
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
            ProgramRun(distance: 5),
            ProgramRun(distance: 19)
        ],
        // Week 10
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
                    description: "4 miles at tempo pace."
                ),
                RunSegment(
                    title: "Cooldown",
                    description: "2 mile at an easy pace."
                ),
            ]),
            ProgramRun(distance: 8),
            ProgramRun(distance: 5),
            ProgramRun(distance: 15)
        ],
        // Week 11
        [
            ProgramRun(distance: 9),
            ProgramRun(distance: 9),
            ProgramRun(workoutSegments: [
                RunSegment(
                    title: "Warmup",
                    description: "2 mile at an easy pace."
                ),
                RunSegment(
                    title: "Intervals",
                    description: "10 x 800m seconds at critical velocity pace. 60 seconds rest between each rep."
                ),
                RunSegment(
                    title: "Cooldown",
                    description: "2 mile at an easy pace."
                ),
            ]),
            ProgramRun(distance: 9),
            ProgramRun(distance: 5),
            ProgramRun(distance: 20)
        ],
        // Week 12
        [
            ProgramRun(distance: 9),
            ProgramRun(distance: 9),
            ProgramRun(workoutSegments: [
                RunSegment(
                    title: "Warmup",
                    description: "2 mile at an easy pace."
                ),
                RunSegment(
                    title: "Intervals",
                    description: "9 miles at tempo pace."
                ),
                RunSegment(
                    title: "Cooldown",
                    description: "2 mile at an easy pace."
                ),
            ]),
            ProgramRun(distance: 9),
            ProgramRun(distance: 5),
            ProgramRun(distance: 15)
        ],
        // Week 13
        [
            ProgramRun(distance: 9),
            ProgramRun(distance: 10),
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
            ProgramRun(distance: 10),
            ProgramRun(distance: 5),
            ProgramRun(distance: 22)
        ],
        // Week 14
        [
            ProgramRun(distance: 7),
            ProgramRun(distance: 7),
            ProgramRun(distance: 10),
            ProgramRun(distance: 7),
            ProgramRun(distance: 5),
            ProgramRun(distance: 14)
        ],
        // Week 15
        [
            ProgramRun(distance: 6),
            ProgramRun(distance: 6),
            ProgramRun(distance: 6),
            ProgramRun(distance: 6),
            ProgramRun(distance: 5),
            ProgramRun(distance: 10)
        ],
        // Week 16
        [
            ProgramRun(distance: 5),
            ProgramRun(distance: 5),
            ProgramRun(distance: 8),
            ProgramRun(distance: 0),
            ProgramRun(distance: 4),
            ProgramRun(distance: 2)
        ]
    ]
}
