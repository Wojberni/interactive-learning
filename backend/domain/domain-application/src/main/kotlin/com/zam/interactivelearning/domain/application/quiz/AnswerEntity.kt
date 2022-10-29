package com.zam.interactivelearning.domain.application.quiz

import javax.persistence.*

@Entity
@Table(name = "ANSWERS")
class AnswerEntity(
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "answers_id_seq")
    @SequenceGenerator(name = "answers_id_seq", sequenceName = "answers_id_seq", allocationSize = 1)
    var id: Long = 0,
    var content: String = "",
    @ManyToOne
    @JoinColumn(name = "question_id", nullable = false)
    var question: QuestionEntity = QuestionEntity(),
    var isCorrect: Boolean = false,
    var createdBy: Long = 0
)
