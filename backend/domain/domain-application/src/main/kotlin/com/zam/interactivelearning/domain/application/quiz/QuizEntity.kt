package com.zam.interactivelearning.domain.application.quiz

import javax.persistence.*

@Entity
@Table(name = "QUIZZES")
class QuizEntity(
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "quizzes_id_seq")
    @SequenceGenerator(name = "quizzes_id_seq", sequenceName = "quizzes_id_seq", allocationSize = 1)
    var id: Long = 0,
    var name: String = "",
    var description: String = "",
    var createdBy: Long = 0,
    @OneToMany(mappedBy = "quiz", cascade = [CascadeType.ALL], orphanRemoval = true, fetch = FetchType.LAZY)
    var questions: MutableSet<QuestionEntity> = mutableSetOf()
)
