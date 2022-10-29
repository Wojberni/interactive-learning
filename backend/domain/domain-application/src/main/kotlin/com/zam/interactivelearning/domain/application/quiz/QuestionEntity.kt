package com.zam.interactivelearning.domain.application.quiz

import javax.persistence.*

@Entity
@Table(name = "QUESTIONS")
class QuestionEntity(
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "questions_id_seq")
    @SequenceGenerator(name = "questions_id_seq", sequenceName = "questions_id_seq", allocationSize = 1)
    var id: Long = 0,
    var content: String = "",
    @ManyToOne
    @JoinColumn(name = "quiz_id", nullable = false)
    var quiz: QuizEntity = QuizEntity(),
    @OneToMany(mappedBy = "question", cascade = [CascadeType.ALL], fetch = FetchType.LAZY)
    var answers: MutableSet<AnswerEntity> = mutableSetOf(),
    var createdBy: Long = 0
)

