package com.zam.interactivelearning.domain.application.user.persistence

import com.zam.interactivelearning.domain.application.notifications.NotificationTargetEntity
import com.zam.interactivelearning.domain.application.quiz.QuizScoreEntity
import javax.persistence.*

@Entity
@Table(name = "USERS")
class UserEntity(
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "users_id_seq")
    @SequenceGenerator(name = "users_id_seq", sequenceName = "users_id_seq", allocationSize = 1)
    var id: Long = 0,
    var email: String = "",
    var username: String = "",
    var password: String = "",
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
        name = "USER_ROLES",
        joinColumns = [JoinColumn(name = "user_id", referencedColumnName = "id")],
        inverseJoinColumns = [JoinColumn(name = "role_id", referencedColumnName = "id")]
    )
    var roles: Set<RoleEntity> = setOf(),
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "USER_FRIENDS",
        joinColumns = [JoinColumn(name = "user_id", referencedColumnName = "id")],
        inverseJoinColumns = [JoinColumn(name = "friend_id", referencedColumnName = "id")]
    )
    var friends: MutableSet<UserEntity> = mutableSetOf(),
    @OneToOne(mappedBy = "user", cascade = [CascadeType.ALL], fetch = FetchType.LAZY)
    var notificationTarget: NotificationTargetEntity? = null,
    @OneToMany(mappedBy = "user", cascade = [CascadeType.ALL], fetch = FetchType.LAZY)
    var quizScores: List<QuizScoreEntity> = listOf(),
)