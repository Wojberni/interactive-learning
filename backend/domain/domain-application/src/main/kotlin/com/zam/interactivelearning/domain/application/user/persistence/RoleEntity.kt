package com.zam.interactivelearning.domain.application.user.persistence

import javax.persistence.*

@Entity
@Table(name = "ROLES")
class RoleEntity(
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "roles_id_seq")
    @SequenceGenerator(name = "roles_id_seq", sequenceName = "roles_id_seq", allocationSize = 1)
    var id: Long = 0,
    var name: String = ""
)