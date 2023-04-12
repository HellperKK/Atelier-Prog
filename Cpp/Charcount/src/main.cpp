#include <iostream>
#include <string>
#include <map>

int main()
{
    std::string sentence{"apportez ce wisky au juge blond qui fume"};
    std::map<char, int> chars;

    for (size_t i = 0; i < sentence.size(); i++)
    {
        if (chars[sentence.at(i)])
        {
            chars[sentence.at(i)]++;
        }
        else
        {
            chars[sentence.at(i)] = 1;
        }
    }

    std::cout << "Dans la pharse '" << sentence << "'" << std::endl; // affiche Hello World !

    for (auto it = chars.begin(); it != chars.end(); ++it)
    {
        std::cout << "Le caractere '" << it->first << "' est present " << it->second << " fois." << '\n';
    }

    return 0;
}
