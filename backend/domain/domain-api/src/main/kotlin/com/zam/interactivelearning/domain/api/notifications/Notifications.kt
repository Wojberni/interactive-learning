package com.zam.interactivelearning.domain.api.notifications

enum class Notifications(
    val notificationName: String
) {
    INCOMING_FRIEND_REQUEST("INCOMING_FRIEND_REQUEST"),
    NEW_DAILY_CHALLENGE("NEW_DAILY_CHALLENGE"),
    FRIEND_ACHIEVED_HIGHER_SCORE("FRIEND_ACHIEVED_HIGHER_SCORE")
}