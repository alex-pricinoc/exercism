// The code below is a stub. Just enough to satisfy the compiler.
// In order to pass the tests you can add-to or change any of this code.
const EARTH_SECONDS_IN_YEAR: u64 = 31557600;

#[derive(Debug)]
pub struct Duration {
    duration: u64,
}

impl From<u64> for Duration {
    fn from(s: u64) -> Self {
        Self { duration: s }
    }
}

pub trait Planet {
    const EARTH_YEARS: f64;
    fn years_during(d: &Duration) -> f64 {
        d.duration as f64 / (EARTH_SECONDS_IN_YEAR as f64 * Self::EARTH_YEARS)
    }
}

macro_rules! planet {
    ($name:ident, $earth_years:expr) => {
        pub struct $name;
        impl Planet for $name {
            const EARTH_YEARS: f64 = $earth_years;
        }
    };
}
planet!(Mercury, 0.2408467);
planet!(Venus, 0.61519726);
planet!(Earth, 1.0);
planet!(Mars, 1.8808158);
planet!(Jupiter, 11.862615);
planet!(Saturn, 29.447498);
planet!(Uranus, 84.016846);
planet!(Neptune, 164.79132);
