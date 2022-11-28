package com.zam.interactivelearning.domain.application.notifications

import javax.persistence.*

@Entity
@Table(name = "NOTIFICATION_TEMPLATES")
class NotificationTemplateEntity(
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "notification_templates_id_seq")
    @SequenceGenerator(
        name = "notification_templates_id_seq",
        sequenceName = "notification_templates_id_seq",
        allocationSize = 1
    )
    var id: Long = 0,
    var notificationName: String = "",
    var notificationTemplate: String = "",
    var notificationTitle: String = ""
)