package com.zam.interactivelearning.infrastructure.application.delivery.friends

import com.zam.interactivelearning.infrastructure.api.delivery.friends.AddFriendRequest
import com.zam.interactivelearning.infrastructure.application.delivery.friends.helper.FriendsEndpointHelper
import com.zam.interactivelearning.security.api.AuthenticatedUser
import org.springframework.http.HttpStatus
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.ResponseStatus
import org.springframework.web.bind.annotation.RestController
import javax.validation.Valid

@RestController
@RequestMapping("/friends")
@AuthenticatedUser
class FriendsEndpoint(
    val friendsEndpointHelper: FriendsEndpointHelper
) {

    @PostMapping("/add")
    @ResponseStatus(HttpStatus.CREATED)
    fun addFriend(@RequestBody @Valid request: AddFriendRequest) {
        friendsEndpointHelper.addFriend(request)
    }
}