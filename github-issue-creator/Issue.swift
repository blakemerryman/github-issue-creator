//
//  Issue.swift
//  github-issue-creator
//
//  Created by Blake Merryman on 4/2/18.
//  Copyright © 2018 Merryman Technology. All rights reserved.
//

struct Issue: Codable {
    let title: String
    let body: String?
    let assignees: [String]?
    let milestone: Int?
    let labels: [String]?
}

// MARK: - Default Issues

extension Issue {

    static let currentMonth = "April"
    static let currentMilestone = 4 // April 2018

    static let defaultIssues: [Issue] = [
        Issue(
            title: "\(currentMonth) Sponsor Information",
            body: """
                - [ ] Payment of $150 for one month of sponsorship to https://www.paypal.me/NashvilleCocoaHeads
                - [ ] Low Res Logo for Meetup (120x90, <20MB)
                - [ ] High Res Logo for general marketing
                - [ ] Job description copy and link to place to send applications.
                - [ ] Need to post Job description and link to [our website](https://github.com/NashvilleCocoaHeads/nashvillecocoaheads.github.io).
              """,
            assignees: nil,
            milestone: currentMilestone,
            labels: nil
        ),
        Issue(
            title: "\(currentMonth) Presentation Information",
            body: """
               Need to get:
                - [ ] Presenter
                - [ ] Presenter bio
                - [ ] Presenter photo
                - [ ] Presentation title
                - [ ] Presentation description
                - [ ] Venue information
              """,
            assignees: nil,
            milestone: currentMilestone,
            labels: nil
        ),
        Issue(
            title: "\(currentMonth) Coding Challenge",
            body: """
              Come up with a coding challenge to present at this month's meet-up to be completed before the next month's meet-up.
              The goal is to give the group something to work on collaboratively between meet-ups.

              Preferably, this challenge will have something to do with the presentation.

              To Do:
              - [ ] Come up with challenge.
              - [ ] Create rough challenge guidelines (examples: "solution must be an iOS app" or "solution must include delegation pattern").
              - [ ] Create repository within CocoaHeads organization for members to PR solutions into.

              > See NashFP organization for inspiration. Here is their [tic-tac-toe repo](https://github.com/NashFP/tic-tac-toe) to use as an example.
              """,
            assignees: nil,
            milestone: currentMilestone,
            labels: []
        ),
        Issue(
            title: "\(currentMonth) Meetup Refreshements",
            body: """
              Need to order or acquire:
              - [ ] Pizza
              - [ ] Drinks
              - [ ] Plates
              - [ ] Napkins

              Should check with sponsors to see if they are willing to provide for us.
              """,
            assignees: nil,
            milestone: currentMilestone,
            labels: []
        ),
        Issue(
            title: "\(currentMonth) Marketing Image",
            body: """
              Need to create marketing image for February meet-up.

              Should be a template in the Mission Control repo.
              """,
            assignees: nil,
            milestone: currentMilestone,
            labels: []
        ),
        Issue(
            title: "\(currentMonth) Meetup Announcement #1",
            body: """
              At 2 weeks out, post to:
              - [ ] Meetup
              - [ ] Twitter
              - [ ] Facebook
              - [ ] CocoaHeads Slack
              - [ ] NashDev Slack
              """,
            assignees: nil,
            milestone: currentMilestone,
            labels: []
        ),
        Issue(
            title: "\(currentMonth) Meetup Announcement #2",
            body: """
              At 1 week out, post to:
              - [ ] Twitter
              - [ ] Facebook
              - [ ] CocoaHeads Slack
              - [ ] NashDev Slack
              """,
            assignees: nil,
            milestone: currentMilestone,
            labels: []
        ),
        Issue(
            title: "\(currentMonth) Video",
            body: """
              - [ ] Create Video
              - [ ] Upload to YouTube
              - [ ] Tweet video link
              """,
            assignees: nil,
            milestone: currentMilestone,
            labels: []
        ),
        Issue(
            title: "\(currentMonth) - 360|iDev Raffle Announcement #1",
            body: """
            At 2 weeks out:
            - [ ] Mention in the Meetup Announcement.
            - [ ] Post to Twitter
            - [ ] Post CocoaHeads Slack
            """,
            assignees: nil,
            milestone: currentMilestone,
            labels: []
        ),
        Issue(
            title: "\(currentMonth) - 360|iDev Raffle Announcement #2",
            body: """
            At 1 week out:
            - [ ] Post to Twitter
            - [ ] Post CocoaHeads Slack
            """,
            assignees: nil,
            milestone: currentMilestone,
            labels: []
        ),
        Issue(
            title: "\(currentMonth) - 360|iDev Raffle Name Gathering",
            body: """
            The night of the meetup, be sure to take role of those interested in going to 360|iDev.
            """,
            assignees: nil,
            milestone: currentMilestone,
            labels: []
        )

    ]

}
