package com.zam.interactivelearning.domain.application.dailychallenge

import com.zam.interactivelearning.domain.application.quiz.QuizEntity
import java.time.LocalDateTime
import javax.persistence.*

@Entity
@Table(name = "DAILY_CHALLENGE")
class DailyChallengeEntity(
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "daily_challenge_id_seq")
    @SequenceGenerator(name = "daily_challenge_id_seq", sequenceName = "daily_challenge_id_seq", allocationSize = 1)
    var id: Long = 0,
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "quiz_id", referencedColumnName = "id")
    var quiz: QuizEntity = QuizEntity(),
    var updatedAt: LocalDateTime = LocalDateTime.now()
)