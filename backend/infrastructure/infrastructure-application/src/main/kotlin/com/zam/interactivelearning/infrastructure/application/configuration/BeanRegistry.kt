package com.zam.interactivelearning.infrastructure.application.configuration

import com.zam.interactivelearning.cqrs.CqrsExecutor
import com.zam.interactivelearning.domain.api.user.GetFinishedActivitiesCountQuery
import com.zam.interactivelearning.domain.application.dailychallenge.GetDailyChallengeQueryHandler
import com.zam.interactivelearning.domain.application.dailychallenge.RotateDailyChallengeCommandHandler
import com.zam.interactivelearning.domain.application.dailychallenge.SendDailyChallengeNotificationEventHandler
import com.zam.interactivelearning.domain.application.flashcard.CreateFlashcardCommandHandler
import com.zam.interactivelearning.domain.application.flashcard.GetFlashcardByIdQueryHandler
import com.zam.interactivelearning.domain.application.friends.*
import com.zam.interactivelearning.domain.application.notifications.GetAllNotificationTargetsQueryHandler
import com.zam.interactivelearning.domain.application.notifications.GetNotificationTargetQueryHandler
import com.zam.interactivelearning.domain.application.notifications.RegisterOrUpdateDeviceTokenCommandHandler
import com.zam.interactivelearning.domain.application.quiz.*
import com.zam.interactivelearning.domain.application.search.SearchActivityQueryHandler
import com.zam.interactivelearning.domain.application.user.*
import com.zam.interactivelearning.events.AsynchronousEventsConfiguration
import com.zam.interactivelearning.events.EventPublisher
import com.zam.interactivelearning.infrastructure.application.delivery.auth.AuthEndpoint
import com.zam.interactivelearning.infrastructure.application.delivery.auth.helper.AuthEndpointHelper
import com.zam.interactivelearning.infrastructure.application.delivery.flashcard.FlashcardEndpoint
import com.zam.interactivelearning.infrastructure.application.delivery.flashcard.helper.FlashcardEndpointHelper
import com.zam.interactivelearning.infrastructure.application.delivery.friends.FriendsEndpoint
import com.zam.interactivelearning.infrastructure.application.delivery.friends.helper.FriendsEndpointHelper
import com.zam.interactivelearning.infrastructure.application.delivery.notifications.NotificationsEndpoint
import com.zam.interactivelearning.infrastructure.application.delivery.notifications.helper.NotificationsEndpointHelper
import com.zam.interactivelearning.infrastructure.application.delivery.quiz.QuizEndpoint
import com.zam.interactivelearning.infrastructure.application.delivery.quiz.helper.QuizEndpointHelper
import com.zam.interactivelearning.infrastructure.application.delivery.quiz.validator.CreateQuizRequestValidator
import com.zam.interactivelearning.infrastructure.application.delivery.search.SearchEndpoint
import com.zam.interactivelearning.infrastructure.application.delivery.search.helper.SearchEndpointHelper
import com.zam.interactivelearning.infrastructure.application.delivery.user.UserEndpoint
import com.zam.interactivelearning.infrastructure.application.delivery.user.helper.UserEndpointHelper
import com.zam.interactivelearning.infrastructure.application.exceptionhandlers.DomainExceptionHandler
import com.zam.interactivelearning.infrastructure.application.exceptionhandlers.MethodArgumentNotValidHandler
import com.zam.interactivelearning.infrastructure.application.exceptionhandlers.RequestValidationExceptionHandler
import com.zam.interactivelearning.infrastructure.application.notifications.FirebaseNotificationSender
import com.zam.interactivelearning.infrastructure.application.notifications.SendNotificationEventHandler
import com.zam.interactivelearning.infrastructure.application.timers.ResetDailyStreakTimer
import com.zam.interactivelearning.infrastructure.application.timers.RotateDailyChallengeTimer
import com.zam.interactivelearning.security.application.configuration.SecurityConfiguration
import com.zam.interactivelearning.security.application.context.UserContextHolderImpl
import com.zam.interactivelearning.security.application.domain.LoginUserCommandHandler
import com.zam.interactivelearning.security.application.jwt.JwtFilter
import com.zam.interactivelearning.security.application.jwt.JwtHelper
import com.zam.interactivelearning.security.application.userdetails.UserDetailsService
import org.springframework.context.support.BeanDefinitionDsl
import org.springframework.context.support.beans

class BeanRegistry {

    fun beans(): List<BeanDefinitionDsl> {
        return listOf(
            registerCommandHandlerBeans(),
            registerQueryHandlerBeans(),
            registerEventHandlerBeans(),
            registerEndpointBeans(),
            registerCqrsBeans(),
            registerSecurityBeans(),
            registerEventBeans(),
            registerTimers(),
            registerOtherBeans()
        )
    }

    private fun registerCommandHandlerBeans() = beans {
        bean<CreateUserCommandHandler>()
        bean<LoginUserCommandHandler>()
        bean<CreateQuizCommandHandler>()
        bean<CreateFlashcardCommandHandler>()
        bean<CreateAddFriendRequestCommandHandler>()
        bean<ChangeFriendRequestStatusCommandHandler>()
        bean<RemoveFriendCommandHandler>()
        bean<RegisterOrUpdateDeviceTokenCommandHandler>()
        bean<RotateDailyChallengeCommandHandler>()
        bean<SaveQuizScoreCommandHandler>()
        bean<ResetDailyStreakCommandHandler>()
    }

    private fun registerQueryHandlerBeans() = beans {
        bean<GetUserByUsernameQueryHandler>()
        bean<GetUsernameByIdQueryHandler>()
        bean<GetAllQuizzesQueryHandler>()
        bean<GetQuizByIdQueryHandler>()
        bean<GetUserByIdQueryHandler>()
        bean<GetFlashcardByIdQueryHandler>()
        bean<GetPendingFriendRequestsQueryHandler>()
        bean<GetFriendsCountByUserIdQueryHandler>()
        bean<GetFriendsQueryHandler>()
        bean<GetNotificationTargetQueryHandler>()
        bean<GetAllNotificationTargetsQueryHandler>()
        bean<GetDailyChallengeQueryHandler>()
        bean<GetFinishedActivitiesCountQueryHandler>()
        bean<SearchActivityQueryHandler>()
    }

    private fun registerEventHandlerBeans() = beans {
        bean<FriendRequestStatusChangedEventHandler>()
        bean<IncrementDailyStreakEventHandler>()

        profile("notifications") {
            bean<SendFriendRequestNotificationEventHandler>()
            bean<SendFriendAchievedHigherScoreNotificationEventHandler>()
            bean<SendDailyChallengeNotificationEventHandler>()
            bean<SendNotificationEventHandler>()
        }
    }

    private fun registerEndpointBeans() = beans {
        bean<AuthEndpoint>()
        bean<AuthEndpointHelper>()
        bean<QuizEndpoint>()
        bean<QuizEndpointHelper>()
        bean<CreateQuizRequestValidator>()
        bean<UserEndpoint>()
        bean<UserEndpointHelper>()
        bean<FlashcardEndpoint>()
        bean<FlashcardEndpointHelper>()
        bean<FriendsEndpoint>()
        bean<FriendsEndpointHelper>()
        bean<NotificationsEndpoint>()
        bean<NotificationsEndpointHelper>()
        bean<SearchEndpoint>()
        bean<SearchEndpointHelper>()

    }

    private fun registerCqrsBeans() = beans {
        bean<CqrsExecutor>()
    }

    private fun registerSecurityBeans() = beans {
        bean<JwtHelper>()
        bean<JwtFilter>()
        bean<UserDetailsService>()
        bean<UserContextHolderImpl>()
        bean<SecurityConfiguration>()
    }

    private fun registerEventBeans() = beans {
        bean<AsynchronousEventsConfiguration>()
        bean<EventPublisher>()
    }

    private fun registerTimers() = beans {
        bean<RotateDailyChallengeTimer>()
        bean<ResetDailyStreakTimer>()
    }

    private fun registerOtherBeans() = beans {
        bean<MethodArgumentNotValidHandler>()
        bean<DomainExceptionHandler>()
        bean<RequestValidationExceptionHandler>()

        profile("firebase") {
            bean<FirebaseNotificationSender>()
        }
    }

}