using System;
using Xunit;
using App.WebApi;

namespace App.Tests
{
    public class UnitTest1
    {
        [Theory]
        [InlineData(25, 77)]
        [InlineData(0, 32)]
        [InlineData(-40, -40)]
        public void WeatherForecast_GivenCelsius_ShouldConvertToFahrenheit(
            int c,
            int expectedF)
        {
            var forecast = new WeatherForecast { TemperatureC = c };
            Assert.Equal(expectedF, forecast.TemperatureF);
        }

    }
}
