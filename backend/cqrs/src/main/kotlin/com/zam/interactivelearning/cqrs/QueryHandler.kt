package com.zam.interactivelearning.cqrs

import kotlin.reflect.KClass

interface QueryHandler<QueryT: Query<ResultT>, ResultT> {
    fun handle(query: QueryT): ResultT
    fun supportedClass(): KClass<QueryT>
}