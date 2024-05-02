//
//  README.swift
//  LoginCrudSupabase
//
//  Created by Chris on 2024-04-21.
//

import Foundation


// IMPORTANTE - Sin esto no te cargaran los datos de supabase!!!!


/*
 Crea las policies en supabase para decir quien puede hacer que. por ejemplo
 quien puede actualizar un dato o agregar un dato
 
 1. Ve a Authentication -> policies -> Create new policy
 
 2. (READ) Preciona SELECT para modificar las policys de lektura para trae datos a tu app. Preciona "Save policy" para guardar.
 
 3. (Insert - user only) Preciona INSERT para agregar datos al Supabase. Hay que hacer Login para poder insertar datos. Preciona Save Policy.
 
 4. (DETELE) Preciona DETELE para borrar datos de Supabase. Preciona Save Policy.
 
 5. (UPDATE - Based on email) Preciona UPDATE. Aqui tienes que cambiarlo el Policy Name a: Enable update for users based on user_uid  y pon  esto en los dos lados abajo:
        ( SELECT (auth.uid() = "Feature".user_id))
 
 
 */
