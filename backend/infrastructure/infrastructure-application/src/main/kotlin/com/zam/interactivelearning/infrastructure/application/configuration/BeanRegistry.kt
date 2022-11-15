package com.zam.interactivelearning.infrastructure.application.configuration

import com.zam.interactivelearning.cqrs.CqrsExecutor
import com.zam.interactivelearning.domain.api.user.GetUserByIdQuery
import com.zam.interactivelearning.domain.application.flashcard.CreateFlashcardCommandHandler
import com.zam.interactivelearning.domain.application.flashcard.GetFlashcardByIdQueryHandler
import com.zam.interactivelearning.domain.application.quiz.CreateQuizCommandHandler
import com.zam.interactivelearning.domain.application.quiz.GetAllQuizzesQueryHandler
import com.zam.interactivelearning.domain.application.quiz.GetQuizByIdQueryHandler
import com.zam.interactivelearning.domain.application.user.CreateUserCommandHandler
import com.zam.interactivelearning.domain.application.user.GetUserByIdQueryHandler
import com.zam.interactivelearning.domain.application.user.GetUserByUsernameQueryHandler
import com.zam.interactivelearning.domain.application.user.GetUsernameByIdQueryHandler
import com.zam.interactivelearning.infrastructure.application.delivery.auth.AuthEndpoint
import com.zam.interactivelearning.infrastructure.application.delivery.auth.helper.AuthEndpointHelper
import com.zam.interactivelearning.infrastructure.application.delivery.flashcard.FlashcardEndpoint
import com.zam.interactivelearning.infrastructure.application.delivery.flashcard.helper.FlashcardEndpointHelper
import com.zam.interactivelearning.infrastructure.application.delivery.quiz.QuizEndpoint
import com.zam.interactivelearning.infrastructure.application.delivery.quiz.helper.QuizEndpointHelper
import com.zam.interactivelearning.infrastructure.application.delivery.quiz.validator.CreateQuizRequestValidator
import com.zam.interactivelearning.infrastructure.application.delivery.user.UserEndpoint
import com.zam.interactivelearning.infrastructure.application.delivery.user.helper.UserEndpointHelper
import com.zam.interactivelearning.infrastructure.application.exceptionhandlers.DomainExceptionHandler
import com.zam.interactivelearning.infrastructure.application.exceptionhandlers.MethodArgumentNotValidHandler
import com.zam.interactivelearning.infrastructure.application.exceptionhandlers.RequestValidationExceptionHandler
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
            registerEndpointBeans(),
            registerCqrsBeans(),
            registerSecurityBeans(),
            registerOtherBeans()
        )
    }

    private fun registerCommandHandlerBeans() = beans {
        bean<CreateUserCommandHandler>()
        bean<LoginUserCommandHandler>()
        bean<CreateQuizCommandHandler>()
        bean<CreateFlashcardCommandHandler>()
    }

    private fun registerQueryHandlerBeans() = beans {
        bean<GetUserByUsernameQueryHandler>()
        bean<GetUsernameByIdQueryHandler>()
        bean<GetAllQuizzesQueryHandler>()
        bean<GetQuizByIdQueryHandler>()
        bean<GetUserByIdQueryHandler>()
        bean<GetFlashcardByIdQueryHandler>()
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

    private fun registerOtherBeans() = beans {
        bean<MethodArgumentNotValidHandler>()
        bean<DomainExceptionHandler>()
        bean<RequestValidationExceptionHandler>()
    }

}