package com.zam.interactivelearning.domain.application.quiz

import com.zam.interactivelearning.domain.application.user.persistence.UserEntity
import java.time.LocalDateTime
import javax.persistence.*

@Entity
@Table(name = "quiz_scores")
class QuizScoreEntity(
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "quiz_scores_id_seq")
    @SequenceGenerator(name = "quiz_scores_id_seq", sequenceName = "quiz_scores_id_seq", allocationSize = 1)
    var id: Long = 0,
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "quiz_id")
    var quiz: QuizEntity = QuizEntity(),
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    var user: UserEntity = UserEntity(),
    var score: Int = 0,
    var createdAt: LocalDateTime = LocalDateTime.now(),
    )