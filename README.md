# **Infinity Looping**

Welcome! 

I'll be using this place as a way to devlog

How to read version numbers!
[Official Version (*Announcement on itch.io; Most stable version*)].[Update (*on Itch.io w/ devlog; Will have minor bugs*)].[Repo Update (*Only on Github; May have game breaking bugs*)]

## **[Version 0.1.1]**

### Hotfix

Fixed bug where when values were zero, the game would bug out because nil values can't be used as arithmetic.

## **[Version 0.1.0]**

Author's Note: Still starving but Eve fixes everything in life

### **Changed Value Names:**

- **Alpha -> Points**
    - Points += MM * (1 + Energy + AM) * (1 + A) * (1 + log10(Skill + 1))
    - Gains per click
- **Beta -> Skill**
    - Skill += MM * (1 + AM) * (log10(Points ^ (2 * (1 + log10(Cash + 1)))) - 5) * (2 - 2^-Time) + A
    - Resets Points on gain 
- **Gamma -> Time**
    - Time += MM * (1 + Energy + AM) * (1 + A)
    - Gains per second after obtaining Beta
- **Delta -> Research**
    - Research += MM * (1 + AM) * (1 + A) * (log10((Research + 1) * (Cash + 1)) ^ SI)
    - Reduces Time by 100 and spends 5 seconds to gain
- **Epsilon -> Energy**
    - Energy += 1 + log10((Research + 1) * (Cash + 1))
    - Gains per second after obtaining Research
- **Zeta -> Profits**
    - Profits = Skill * (2 - 2^-Energy) * (1 + log10(Research + 1))
    - Resets everything below it
- **Acronyms:**
    - MM = Multiplicative Multipliers
    - AM = Additive Multipliers
    - A = Additives
    - SI = Self Increase

### **New Values**

- **Cash**
    - Cash += Profits
    - Gains per second on gaining Profits

### **Game Behaviors:**

- Changed Node Behaviors to match current status
- Changed Debug gui to one text, displaying all pinned values
- Updated names inside debug
- Added feature for Auto Collection

### **Upgrade Descriptions:**

- How to read: [Max Upgrades]; [Cost per upgrade]; [Increases/Unlocks]
- **Points:**
    1. inf; Points: 10 + (10 * upgrade); PointA + 1, Points Upgrade 2, Points Upgrade 3
    2. inf; Points: 10 * (10 ^ upgrade); PointAM + 2
    3. 3; Points: 10 * (10 ^ upgrade) + (20 * upgrade); PointMM * 2
- **Skills:**
    1. inf; Skill: 1 + (10 * upgrade); PointA + 1, Skill Upgrade 2, Skill Upgrade 3, Skill Upgrade 4
    2. inf; Skill: 1 * (10 ^ upgrade); SkillA + 1
    3. 3; Skill: 100 * (10 ^ upgrade) + (20 * upgrade); SkillAM + 10
    4. 9; Points: 1 * (10 ^ upgrade) + (20 * upgrade), Skill: 100 * (100 ^ upgrade) + (20 * upgrade); Points autoclicker that collects every (10 - upgrade level) second(s)
- **Time (Temporary):**
    1. inf; Time: 1 + (10 * upgrade); TimeA + 1, Time Upgrade 2, Time Upgrade 3
    2. inf; Time: 1 * (10 ^ upgrade); SkillA + 1
    3. 3; Time: 100 * (10 ^ upgrade) + (20 * upgrade); PointAM + 2
- **Research (Temporary):**
    1. inf; Research: 1 + (10 * upgrade); PointA + 1, Research Upgrade 2, Research Upgrade 3
    2. inf; Research: 1 * (10 ^ upgrade); SkillA + 1
    3. 3; Research: 100 * (10 ^ upgrade) + (20 * upgrade); PointAM + 10
- **Energy:**
    1. None
- **Profits:**
    1. None
- **Cash:**
    1. 1; Cash: 100; Stops resetting Reset Layer 1 upgrades when resetting Reset Layer 1, Cash Upgrade 2
    2. 1; Cash: 10000; Gains Beta based off 1% of actual gain in Cash automatically

### **Added Descriptions**

- Upgrades now display their price above them
- Upgrades now display amount upgraded below them
- Stars now display what currency they increase

### **Saving and Loading**

- Saving and Loading boxes are now labeled
- Upgrades and consecutive upgrades are loaded correctly even if added in a new update

## **[Version 0.0.1]**

Author's Note: I'm lowk starving and the only thing I have right now is slightly spicy fish tofu...

### **Started Project**

### **Added values (Temporary Names):**

- **Alpha** 
    - The baseline currency, it can be obtained by clicking the button (RL[Reset Layer] 1) (The first star)
- **Beta** 
    - Another baseline currency, it can be obtained by clicking another button that resets alpha (RL 2) (The second star)
- **Gamma** 
    - You gain this currency per second if you have Beta (increaseable) (RL 2)
- **Delta** 
    - After clicking the button for this currency, you have to wait a set amount of time before you gain the currency and is able to click it again (RL 2) (The third star)
- **Epsilon** 
    - This currency is gained per second as long as you have Delta (non increaseable) (RL 2)
- **Zeta** 
    - A third currency that gets their multiplier off of: Beta (as the main), Epsilon (2 - e^Epsilon) and Delta (log 10 (Delta + 1) + 1) (RL 3)

### **Added Temporary Upgrades (left to right, down to up)**

- **Set additives, additive multipliers and multiplicative multipliers**
    - Additives = Additives + addition
    - Additive Multipliers = Additive Multipliers + addition
    - Multiplicative Multipliers = Multiplicative Multipliers * addition
- Set costs

### **Added Save. Load and Reset**

- Load is done automatically on loading the instance
- Save is the blue box on the left
- Reset is the red box on the left

### **Added Debug Gui**

- Shows all values