/*
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.facebook.presto.password.cognito;

import io.airlift.configuration.Config;
import io.airlift.configuration.ConfigDescription;
import io.airlift.units.Duration;

import javax.validation.constraints.NotNull;

import java.util.concurrent.TimeUnit;

public class CognitoConfig
{
    private String password;
    private Duration cognitoCacheTtl = new Duration(1, TimeUnit.HOURS);

    @NotNull
    public String getPassword()
    {
        return password;
    }

    @Config("cognito.password")
    @ConfigDescription("Password for initial implementation")
    public CognitoConfig setPassword(String password)
    {
        this.password = password;
        return this;
    }

    @NotNull
    public Duration getCognitoCacheTtl()
    {
        return cognitoCacheTtl;
    }

    @Config("cognito.cache-ttl")
    public CognitoConfig setCognitoCacheTtl(Duration cognitoCacheTtl)
    {
        this.cognitoCacheTtl = cognitoCacheTtl;
        return this;
    }
}