package com.zam.interactivelearning.domain.application.flashcard

import javax.persistence.*

@Entity
@Table(name = "FLASHCARDS")
class FlashCardEntity(
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "flashcards_id_seq")
    @SequenceGenerator(name = "flashcards_id_seq", sequenceName = "flashcards_id_seq", allocationSize = 1)
    var id: Long = 0,
    var content: String = "",
    var answer: String = "",
    var createdBy: Long = 0
)

