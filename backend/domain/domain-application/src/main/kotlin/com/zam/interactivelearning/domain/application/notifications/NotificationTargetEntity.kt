package com.zam.interactivelearning.domain.application.notifications

import com.zam.interactivelearning.domain.application.user.persistence.UserEntity
import java.time.LocalDateTime
import javax.persistence.*

@Entity
@Table(name = "NOTIFICATION_TARGETS")
class NotificationTargetEntity(
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "notification_targets_id_seq")
    @SequenceGenerator(name = "notification_targets_id_seq", sequenceName = "notification_targets_id_seq", allocationSize = 1)
    var id: Long = 0,
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    var user: UserEntity? = null,
    var targetFirebaseToken: String = "",
    var createdAt: LocalDateTime = LocalDateTime.now(),
    var updatedAt: LocalDateTime = LocalDateTime.now(),
) {

}